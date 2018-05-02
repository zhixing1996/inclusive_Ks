#include <iostream>
#include <cstdlib>
#include <fstream>
//#include "CLHEP/Units/PhysicalConstants.h"
#include <cmath>
#include <complex>
#include "TF1.h"
#include "TCanvas.h"
#include "TGraph.h"
#include "TGraphErrors.h"
#include "TStyle.h"
#include "TLegend.h"
#include "TAxis.h"
#include "TFile.h"
#include <ctime>
#include <iomanip>
#include <stdio.h>      /* printf */
#include <math.h>       /* sin */
#include <TMath.h>       /* sin */

using namespace std;
const double alpha = 1.0/137;
const double  alpha2= 1.0/137./137.;
const double  pi = 3.14159265359;
const double  pi2 = 9.86960440109;
const double  me= 0.511e-3;
const double  me2= 0.511*0.511e-6;

const int Nvac=500;
double Evac[Nvac];
double CSvac[Nvac];
const int Nqed=110;
double Eqed[Nqed];
double CSqed[Nqed];
double eCSqed[Nqed];

double vacc(double W)
{
    for(int i=0; i<Nvac; i++){
        if(W>=Evac[i]&&W<Evac[i+1]) {
            if(Evac[i]!=Evac[i+1]) return CSvac[i]+(W-Evac[i])*(CSvac[i+1]-CSvac[i])/(Evac[i+1]-Evac[i]);
            else {
                cerr<<"Error: x1=x2,this is not permitted"<<endl;
                exit(-1);
            }
        }
    }
}

double vpfl(double ml, double s)
{
    double a2=1.0-4.*ml*ml/s;
    double a=sqrt(a2);
    double b=(1.0-a)/(1.0+a);
    double vpfl=alpha/pi*(8./9.-alpha2/3+a*(0.5-a2/6)*log(b));
}


double vpft(double s)
    // vacuum polorization function of leptons
{
    double me=0.511e-3;
    double mmu=0.106;
    double mtau=1.777;
    double mu=2.3e-3;
    double md=4.8e-3;
    double ms=9.5e-2;
    double mc=1.275;
    double mb=4.18;
    double mt=173;
    return (vpfl(me,s)+vpfl(mu,s)+vpfl(mtau,s));
}


double phi(double scos,double y)
{
    double theta=acos(scos);
    double sinp=sin(theta*(1-y));
    double ssin=sin(theta);
    double sinpy=sin(pi*y);
    return (pi*y*sinp)/(ssin*sinpy);
}

double rescs(double *ecm0,double *par)
{
    double s=ecm0[0]*ecm0[0];
    double MJ=par[0];
    double MJ2=par[0]*par[0];
    double GT=par[1];
    double GT2=par[1]*par[1];
    double GE=par[2];
    double res=par[3];
    double ecm=par[4];
    double BfKsX=par[5];
    double Emin=1.4;
    double GF=GT*BfKsX;
    double phase=par[7]*TMath::Pi()/180.0;   
 
    double beta = 2.0*alpha/pi*(2.0*log(ecm0[0]/me)-1.0);
    double delta= 0.75*beta+alpha/pi*(pi2/3.0-0.5)+beta*beta*(9./32.-pi2/12.);
    double a2=pow((1.0-MJ2/s),2)+MJ2*GT2/s/s;
    double a=sqrt(a2);
    double scos=1./a*(MJ2/s-1.);
    double ssin=sqrt(1-scos*scos);
    double Xf=1.-4.*Emin*Emin/s;

    double C1=(8.*pi*alpha*sqrt(GE*GF)/MJ*( (s-MJ2)*cos(phase)+MJ*GT*sin(phase)) +12*pi*(GE*GF/MJ2)*s)/s/s;
    double C2=(8.*pi*alpha*sqrt(GE*GF)/MJ*cos(phase)-12*pi*GE*GF/MJ2)/s;
    double Xf0 = pow(Xf,beta)/(beta);
    double Xf1 = pow(Xf,beta-1.)/(beta-1.);
    double Xf2 = pow(Xf,beta-2.)/(beta-2.);
    double Xf3 = pow(Xf,beta-3.)/(beta-3.);
    double Xf4 = pow(Xf,beta-4.)/(beta-4.);
    double R2=2.*(s-MJ2)/s;
    double R3=a2*(4.*cos(beta)*cos(beta)-1.);
    
    double temp1=C1*(1+delta)*( pow(a,beta-2)*phi(scos,beta)+beta*(Xf2+Xf3*R2+Xf4*R3) );
    double temp2=( -1.0*beta*(1+delta)*C2-(beta+beta*beta/4.)*C1 )*( pow(a,beta-1)/(1+beta    )*phi(scos,beta+1)+Xf1+Xf2*R2+Xf3*R3 );
    double temp3=( 0.5*log((Xf*Xf+2.*a*Xf*scos+a2)/a2)-scos/ssin*(atan((Xf+a*scos)/(a*ssin    ))-pi/2.+(asin(ssin)+acos(scos))/2.0) ) * ( (beta+beta*beta/4.)*C2+(beta/2.-beta*beta*3./8    )*C1 ); 
    double inter=temp1+temp2+temp3;

    double dXS=(1./sqrt(2*pi)/res*exp(-pow((ecm-ecm0[0]),2)/(2.*res*res)))*(inter)*389379.6623;//*pow(1.0/s,2);
    return dXS;

}

double qedxs(double s)
{
    double COEF=4.0*pi*alpha*alpha*389379.6623/3.0/s;//*sqrt(b)*(1.0+2.0*a);
    return COEF;

}

double funs(double *x, double *par)
{
    double s=par[0]*par[0];
    double beta = 2.0*alpha/pi*(log(s/me/me)-1.0);
    double dXS = beta*TMath::Power(x[0],beta-1)*qedxs(s*(1-x[0]));
    return dXS;
}

double funh(double *x, double *par)
{
    double s=par[0]*par[0];
    double Emin=1.4;
    double beta = 2.0*alpha/pi*(log(s/me/me)-1.0);
    double Xf=1.-4.*Emin*Emin/s;

    double hard1=1.0-x[0]/2.0;
    double hard2=4.0*(2.0-x[0])*log(1.0/x[0])+1.0/x[0]*(1.0+3.0*(1.0-x[0])*(1.0-x[0]))*log(1.0/(1.0-x[0]))-6.0+x[0];
    double dXS=(-beta*hard1+beta*beta/8.0*hard2)*qedxs(s*(1-x[0]));
    return dXS;
}


double intXS(double *ecm, double *par)
{
    double res=par[3];
    double hs =par[5];

    TF1 *fXS = new TF1("fXS", rescs, 3.05, 3.12, 8);
    fXS->SetParameter(0, par[0]); //mass of Jpsi
    fXS->SetParameter(1, par[1]); //total width of Jpsi
    fXS->SetParameter(2, par[2]); //Gamma_ee
    fXS->SetParameter(3, par[3]); //Gauss resolution
    fXS->SetParameter(4, ecm[0]); //initial energy
    fXS->SetParameter(5, par[4]); // BfKsX
    fXS->SetParameter(6, par[5]); // h(s) for sigma_mumu 
    fXS->SetParameter(7, par[6]); // phase
    double my_intXS=fXS->Integral(TMath::Min(ecm[0],par[0])-20*res, TMath::Max(ecm[0],par[0])+20*res);


    double beta = 2.0*alpha/pi*(2.0*log(ecm[0]/me)-1.0);
    double delta= 0.75*beta+beta*beta/24.0*(1.0/3*log(ecm[0]/me/me)+2.0*pi*pi-37.0/4);
    double epsilon = 1.0e-8;
    double emin = 1.4;
    double UPL = 1.0-4.0*emin*emin/(ecm[0]*ecm[0]);
    TF1 *fXS_funs = new TF1("fXS_funs", funs, 0.0, 1.0, 1);
    fXS_funs->SetParameter(0, ecm[0]); //initial energy
    double my_intXS_qed1 = fXS_funs->Integral(epsilon, UPL);
    double my_intXS_qed2 = TMath::Power(epsilon,beta)*qedxs(ecm[0]*ecm[0]);//(86.8/(ecm[0]*ecm[0])), born cross section of mu+mu-
    TF1 *fXS_funh = new TF1("fXS_funh", funh, 0.0, 1.0, 1);
    fXS_funh->SetParameter(0, ecm[0]); //initial energy
    double my_intXS_qed3 = fXS_funh->Integral(0.0, UPL);
    double my_intXS_qed = hs*( my_intXS_qed2); //

    return my_intXS+my_intXS_qed;

}



int main(int argc, char *argv[])
{
    gStyle->SetOptFit(100);
    std::cout<<setprecision(12);
    ifstream vacfile("vacc.dat");//,ios::in);
    for(int i=0;i<Nvac;i++)
    {
        vacfile>>Evac[i]>>CSvac[i];
    }

    TCanvas * canvas=new TCanvas("canvas","canvas",10,10,610,610);
    
    TF1 * thecs=new TF1("thecs",intXS,3.04,3.13,7);
    thecs->SetParName(0, "Jpsi mass"); //set the parameter of intXS
    thecs->FixParameter(0, 3.09746);
    thecs->SetParName(1, "Jpsi totalwidth");
    thecs->FixParameter(1, 92.9E-6);
    thecs->SetParName(2, "Jpsi ee width");
    thecs->FixParameter(2, 5.54e-6);
    thecs->SetParName(3, "resolution");
    thecs->FixParameter(3, 9.11483e-04);
    thecs->SetParName(4, "BfKsX"); //BF of jpsi->KsX
    thecs->SetParameter(4, 0.01); //
    thecs->SetParName(5, "hs"); //h(s), free para for sigma_mumu
    thecs->SetParameter(5, 3.5); //
    thecs->SetParName(6, "phase"); //relative phase
    thecs->SetParameter(6, 50); //

    const int Npoints=16;
    double ecm0[Npoints],expcs[Npoints],ecm0err[Npoints],expcserr[Npoints], expcs_cor[Npoints], expcserr_cor[Npoints],temp_cross,temp_ecm;

   for (int i=0;i<Npoints;i++ ){
         expcs_cor[i]=0;
   }

    TString apple="/besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TenCrossWithDiffNPhase/num_combination/rootfile/fit_ks_phase";
    for (int i=1; i<argc;i++){
      apple+="_";
      apple+=argv[i];
     }
    apple+=".root";

    ofstream paras;
    TString orange="/besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TenCrossWithDiffNPhase/num_combination/logfile/fit_ks_phase";
    for (int i=1; i<argc;i++){
      orange+="_";
      orange+=argv[i];
     }
    orange+=".txt";
    paras.open(orange);

    stringstream stream1;
    stream1 << argv[1];
    TString greap1="../results/result_0_"+stream1.str()+".txt";
    ifstream cross1(greap1);
    for(int i=0;i<Npoints;i++){
        cross1 >> ecm0[i] >> temp_cross;
        expcs_cor[i]+= temp_cross;
    }

    stringstream stream2;
    stream2 << argv[2];
    TString greap2="../results/result_1_"+stream2.str()+".txt";
    ifstream cross2(greap2);
    for(int i=0;i<Npoints;i++){
        cross2 >> ecm0[i] >> temp_cross;
        expcs_cor[i]+= temp_cross;
    }

    stringstream stream3;
    stream3 << argv[3];
    TString greap3="../results/result_2_"+stream3.str()+".txt";
    ifstream cross3(greap3);
    for(int i=0;i<Npoints;i++){
        cross3 >> ecm0[i] >> temp_cross;
        expcs_cor[i]+= temp_cross;
    }

    stringstream stream4;
    stream4 << argv[4];
    TString greap4="../results/result_3_"+stream4.str()+".txt";
    ifstream cross4(greap4);
    for(int i=0;i<Npoints;i++){
        cross4 >> ecm0[i] >> temp_cross;
        expcs_cor[i]+= temp_cross;
    }

    stringstream stream5;
    stream5 << argv[5];
    TString greap5="../results/result_4_"+stream5.str()+".txt";
    ifstream cross5(greap5);
    for(int i=0;i<Npoints;i++){
        cross5 >> ecm0[i] >> temp_cross;
        expcs_cor[i]+= temp_cross;
    }

    stringstream stream6;
    stream6 << argv[6];
    TString greap6="../results/result_5_"+stream6.str()+".txt";
    ifstream cross6(greap6);
    for(int i=0;i<Npoints;i++){
        cross6 >> ecm0[i] >> temp_cross;
        expcs_cor[i]+= temp_cross;
    }

    stringstream stream7;
    stream7 << argv[7];
    TString greap7="../results/reslut_6_"+stream7.str()+".txt";
    ifstream cross7(greap7);
    for(int i=0;i<Npoints;i++){
        cross7 >> ecm0[i] >> temp_cross;
        expcs_cor[i]+= temp_cross;
    }

    stringstream stream8;
    stream8 << argv[8];
    TString greap8="../results/result_7_"+stream8.str()+".txt";
    ifstream cross8(greap8);
    for(int i=0;i<Npoints;i++){
        cross8 >> ecm0[i] >> temp_cross;
        expcs_cor[i]+= temp_cross;
    }

    stringstream stream9;
    stream9 << argv[9];
    TString greap9="../results/result_8_"+stream9.str()+".txt";
    ifstream cross9(greap9);
    for(int i=0;i<Npoints;i++){
        cross9 >> ecm0[i] >> temp_cross;
        expcs_cor[i]+= temp_cross;
    }

    stringstream stream10;
    stream10 << argv[10];
    TString greap10="../results/result_9_"+stream10.str()+".txt";
    ifstream cross10(greap10);
    for(int i=0;i<Npoints;i++){
        cross10 >> ecm0[i] >> temp_cross;
        expcs_cor[i]+= temp_cross;
    }

   for (int i=0;i<Npoints;i++ ){
        expcserr_cor[i]=0.005*expcs_cor[i];
   }

    ecm0err[0] =0.026E-3;
    ecm0err[1] =0.028E-3;
    ecm0err[2] =0.023E-3;
    ecm0err[3] =0.043E-3;
    ecm0err[4] =0.022E-3;
    ecm0err[5] =0.025E-3;
    ecm0err[6] =0.084E-3;
    ecm0err[7] =0.081E-3;
    ecm0err[8] =0.075E-3;
    ecm0err[9] =0.076E-3;
    ecm0err[10]=0.075E-3;
    ecm0err[11]=0.093E-3;
    ecm0err[12]=0.106E-3;
    ecm0err[13]=0.090E-3;
    ecm0err[14]=0.093E-3;
    ecm0err[15]=0.115E-3;

    TString banana="/besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TenCrossWithDiffNPhase/num_combination/cross/fit_ks_phase";
    for (int i=1; i<argc;i++){
      banana+="_";
      banana+=argv[i];
     }
    banana+=".txt";

    ofstream fitdat(banana);
    for(int jj=0;jj<Npoints;jj++){
      fitdat<<ecm0[jj]<<" "<<expcs_cor[jj]<<endl;
    }
    fitdat.close();
  
    TGraphErrors * grapherrors_cor=new TGraphErrors(Npoints,ecm0,expcs_cor,ecm0err,expcserr_cor); 
    grapherrors_cor->Fit(thecs,"EV0");

    grapherrors_cor->GetXaxis()->SetTitle("E (GeV)");
    grapherrors_cor->GetYaxis()->SetTitle("cross section (nb)");

    grapherrors_cor->GetXaxis()->CenterTitle();
    grapherrors_cor->GetYaxis()->CenterTitle();
    grapherrors_cor->GetXaxis()->SetLabelOffset(0.01);
    grapherrors_cor->GetXaxis()->SetTitleOffset(0.90);
    grapherrors_cor->GetYaxis()->SetTitleOffset(1.22);
    grapherrors_cor->SetMarkerStyle(20);
    grapherrors_cor->SetMarkerSize(1.1);
    grapherrors_cor->SetMarkerColor(2);
    grapherrors_cor->SetLineColor(2);
    grapherrors_cor->SetLineColor(2);    thecs->SetNpx(499);
    grapherrors_cor->SetLineColor(2);
    grapherrors_cor->SetLineColor(2);    grapherrors_cor->Draw("ape");
    thecs->SetLineColor(4);
    thecs->Draw("same");

    paras<<"chi2 "<<thecs->GetChisquare()<<"      ndf "<<thecs->GetNDF()<<"    prob "<<thecs->GetProb()<<endl;
    paras<<"par0 "<<thecs->GetParameter(0)<<"    err0 "<<thecs->GetParError(0)<<endl;
    paras<<"par1 "<<thecs->GetParameter(1)<<"    err1 "<<thecs->GetParError(1)<<endl;
    paras<<"par2 "<<thecs->GetParameter(2)<<"    err2 "<<thecs->GetParError(2)<<endl;
    paras<<"par3 "<<thecs->GetParameter(3)<<"    err3 "<<thecs->GetParError(3)<<endl;
    paras<<"par4 "<<thecs->GetParameter(4)<<"    err4 "<<thecs->GetParError(4)<<endl;
    paras<<"par5 "<<thecs->GetParameter(5)<<"    err5 "<<thecs->GetParError(5)<<endl;
    paras<<"par6 "<<thecs->GetParameter(6)<<"    err6 "<<thecs->GetParError(6)<<endl;
    paras.close();

    canvas->SaveAs(apple);
    return 0;
}
