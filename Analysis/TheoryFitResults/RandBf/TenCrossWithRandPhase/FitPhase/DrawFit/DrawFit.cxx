#include <iostream.h>
#include <iomanip.h>
#include <stdio.h>

  using namespace std;

void DrawFit(){
    gSystem->Load("libRooFit");
    using namespace RooFit;
    gStyle->SetOptFit(1111);
    gStyle->SetPadTickX(0);
    gStyle->SetPadTickY(0);
    gStyle->SetFrameBorderMode(0);
    gStyle->SetCanvasBorderMode(0);
    gStyle->SetPadBorderMode(0);
    gStyle->SetPadColor(0);
    gStyle->SetCanvasColor(0);
    gStyle->SetTitleFillColor(0);
    gStyle->SetPadLeftMargin(0.15);
    gStyle->SetTitleFont(22,"xyz");  // set the all 3 axes title font
    gStyle->SetTitleFont(22," ");    // set the pad title font
    gStyle->SetTitleSize(0.06,"xyz"); // set the 3 axes title size
    gStyle->SetTitleSize(0.06," ");   // set the pad title size
    gStyle->SetLabelFont(22,"xyz");
    gStyle->SetLabelSize(0.05,"xyz");
    gStyle->SetTextFont(22);
    gStyle->SetTextSize(0.08);
    gStyle->SetStatFont(22);
    gStyle->SetMarkerStyle(8);
    gStyle->SetHistLineWidth(1.85);
    gStyle->SetLineStyleString(2,"[12 12]"); // postscript dashes
    gStyle->SetErrorX(0.001);
    gStyle->SetOptTitle(0);
    gStyle->SetOptStat(0);
    gStyle->SetOptFit(0);

    RooMsgService::instance().deleteStream(0) ;
    RooMsgService::instance().deleteStream(1) ;
    RooMsgService::instance().Print() ;

    TCanvas *c = new TCanvas("c","c",1000,700);
    
    c->cd();
    // c->SetGrid();
    c->cd()->SetBottomMargin(0.15);;

    TPad *pad = new TPad("pad","",0.0,0.0,1.0,1.0);
    pad->SetBottomMargin(0.15);
    pad->SetFrameLineColor(kBlack);
    pad->SetFrameLineWidth(4.5);
    pad->Draw();
    
    RooRealVar Phase("Phase","",-1.85,-1.4);
    RooArgSet mchic_etapipi;
    mchic_etapipi.add(RooArgSet(Phase));
    RooDataSet *Distribution= RooDataSet::read("../GetPhase/Phase.txt",mchic_etapipi,"Q");
    RooRealVar mean("mean", "mean",-1.699,-1.8,-1.45);
    RooRealVar sigma("sigma", "sigma", 0.03,0,1);
    //RooRealVar mean("mean", "mean", -1.6, -1.9,-1.5);
    //RooRealVar sigma("sigma", "sigma", 0.01, 0, 1);
    RooGaussian gauss("gauss", "gauss", Phase, mean, sigma);

    RooRealVar nsig("nsig","#sig events", 100., 0., 300.);

    RooAddPdf model("model", "g", RooArgList(gauss), RooArgList(nsig));
    RooPlot* xframe = Phase.frame(Title("Relative Phase(#circ)")) ;
    model.fitTo(*Distribution, Minos(kTRUE),Extended(),Strategy(2));

    xframe->GetXaxis()->SetTitle("Relative Phase/#circ");
    xframe->GetYaxis()->SetTitle("Times");
    xframe->GetXaxis()->CenterTitle(1);
    xframe->GetXaxis()->SetDecimals(1);
    xframe->GetXaxis()->SetTitleSize(0.05);
    xframe->GetXaxis()->SetLabelOffset(0.02);
    xframe->SetTitleOffset(1.25,"X");
    xframe->GetYaxis()->CenterTitle(1);
    xframe->GetYaxis()->SetLabelSize(0.06);
    xframe->GetYaxis()->SetTitleSize(0.07);
    xframe->SetTitleOffset(0.85,"Y");

    Distribution->plotOn(xframe,Binning(40),MarkerColor(kBlack),LineWidth(1));
    model.plotOn(xframe, Components("gauss"), LineStyle(2),LineColor(kBlack));
    //model.paramOn(xframe, Layout(0.55, 0.9, 0.9), Format("NEU", AutoPrecision(2)));
    model.plotOn(xframe);
    cout<<"mean= "<<mean.getVal()<<" +- "<<mean.getError()<<endl;
    cout<<"sigma= "<<sigma.getVal()<<" +- "<<sigma.getError()<<endl;

    xframe->Draw();

    leg = new TLegend(0.70,0.65,0.88,0.75);
    leg->SetHeader("(b)");
    leg->SetLineColor(0);
    leg->SetFillColor(0);
    leg->Draw();

    c->Print("PhaseFit.eps");

}
