#include <iostream.h>
#include <iomanip.h>
#include <stdio.h>

  using namespace std;

void DrawFit1(){
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

    const int n1 =10;
    Double_t bfxval1[n1], bfxerr1[n1], bfval1[n1], bferr1[n1];
    ifstream openfile;
    openfile.open("../CalRelativeDiff/RelativeDiff1.txt");
    for ( Int_t m = 0; m<n1; m++){
        bfxval1[m] = m; 
        bfxerr1[m] = 0.000001;
    }   
    
    for (Int_t m = 0; m<n1; m++) {
        openfile>>bfval1[m];
        bferr1[m] = 0.000001;
    }   
    
    
    TGraphErrors *graph = new TGraphErrors(n1, bfxval1, bfval1, bfxerr1, bferr1);
    graph->GetYaxis()->SetRangeUser(-3,0);
    graph->GetXaxis()->SetRangeUser(0,13);
    graph->GetXaxis()->SetTitle("Number");
    graph->GetYaxis()->SetTitle("Branch Fraction Relative Difference(%)");
    graph->SetLineColor(2);
    graph->GetXaxis()->CenterTitle();
    graph->GetYaxis()->CenterTitle();
    
    graph->Draw("a*");
    graph->Fit("pol0");
    
    TF1 *f = graph->GetFunction("pol0");
    f->SetLineWidth(1);
    openfile.close();
    c->Print("RelativeDiffFit1.eps");

}
