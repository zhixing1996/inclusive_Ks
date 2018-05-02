#include <iostream.h>
#include <iomanip.h>
#include <stdio.h>

  using namespace std;

void DrawFit7(){
    gSystem->Load("libRooFit");
    using namespace RooFit;
    gStyle->SetOptFit(1111);
    gStyle->SetPadTickX(1);
    gStyle->SetPadTickY(1);
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
    c->cd()->SetBottomMargin(0.15);;
 
    TPad *pad = new TPad("pad","",0.0,0.0,1.0,1.0);
    pad->SetBottomMargin(0.15);
    pad->SetFrameLineColor(kBlack);
    pad->SetFrameLineWidth(4.5);
    pad->Draw();
                                                                 
    // const int n7 =120;
    // Double_t bfxval7[n7], bfxerr7[n7], bfval7[n7], bferr7[n7];
    // ifstream openfile;
    // openfile.open("../GetPhase/Phase7.txt");
    // for ( Int_t m = 0; m<n7; m++){
    //     bfxval7[m] = m; 
    //     bfxerr7[m] = 0.000001;
    // }   
    // 
    // for (Int_t m = 0; m<n7; m++) {
    //     openfile>>bfval7[m];
    //     bferr7[m] = 0.000001;
    // }   
    // 
    // 
    // TGraphErrors *graph = new TGraphErrors(n7, bfxval7, bfval7, bfxerr7, bferr7);
    // graph->GetYaxis()->SetRangeUser(2,15);
    // graph->GetXaxis()->SetRangeUser(0,120);
    // graph->GetXaxis()->SetTitle("Number");
    // graph->GetYaxis()->SetTitle("Branch Fraction Phase(degree)");
    // graph->SetLineColor(2);
    // graph->GetXaxis()->CenterTitle();
    // graph->GetYaxis()->CenterTitle();
    // 
    // graph->Draw("a*");
    // graph->Fit("pol2");
    // 
    // TF1 *f = graph->GetFunction("pol2");
    // f->SetLineWidth(1);
    // openfile.close();


    RooRealVar Phase("Phase","",-52,52);
    RooArgSet mchic_etapipi;
    mchic_etapipi.add(RooArgSet(Phase));
    RooDataSet *Distribution= RooDataSet::read("../GetPhase/Phase7.txt",mchic_etapipi,"Q");
    RooRealVar mean("mean", "mean", 0, -52,-52);
    RooRealVar sigma("sigma", "sigma", 3, 0, 20);
    RooGaussian gauss("gauss", "gauss", Phase, mean, sigma);
    // RooRealVar t("t","t",-40,40) ;
    // RooRealVar mean("mean","mean landau",8.,5,15) ;
    // RooRealVar sigma("sigma","sigma landau",4,-100,100) ;
    // RooLandau landau("lx","lx",t,mean,sigma) ;

    RooRealVar nsig("nsig","#sig events", 100., 0., 300.);

    RooAddPdf model("model", "g", RooArgList(gauss), RooArgList(nsig));
    RooPlot* xframe = Phase.frame(Title("Phase(degree)")) ;
    model.fitTo(*Distribution, Minos(kTRUE),Extended(),Strategy(2));

    xframe->GetXaxis()->SetTitle("Phase(degree)");
    xframe->GetYaxis()->SetTitle("Times");
    xframe->GetXaxis()->CenterTitle(1);
    xframe->GetXaxis()->SetDecimals(1);
    xframe->GetXaxis()->SetTitleSize(0.05);
    xframe->SetTitleOffset(1.25,"X");
    xframe->GetYaxis()->CenterTitle(1);
    xframe->GetYaxis()->SetLabelSize(0.06);
    xframe->GetYaxis()->SetTitleSize(0.07);
    xframe->SetTitleOffset(0.85,"Y");

    Distribution->plotOn(xframe,Binning(100),MarkerColor(kBlack),LineWidth(1));
    model.plotOn(xframe, Components("gauss"), LineStyle(2),LineColor(kBlack));
    model.paramOn(xframe, Layout(0.55, 0.9, 0.9), Format("NEU", AutoPrecision(2)));
    model.plotOn(xframe);
    cout<<"mean= "<<mean.getVal()<<" +- "<<mean.getError()<<endl;
    cout<<"sigma= "<<sigma.getVal()<<" +- "<<sigma.getError()<<endl;

    xframe->Draw();
    c->Print("PhaseFit7.eps");
            
}
