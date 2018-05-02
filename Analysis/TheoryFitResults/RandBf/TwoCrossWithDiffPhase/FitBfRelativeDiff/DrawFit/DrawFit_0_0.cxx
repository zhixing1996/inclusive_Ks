void DrawFit_0_0()
{
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
        //c->SetGrid();
	//c->cd()->SetBottomMargin(0.15);;

	TPad *pad = new TPad("pad","",0.0,0.0,1.0,1.0);
	pad->SetBottomMargin(0.15);
	pad->SetFrameLineColor(kBlack);
	pad->SetFrameLineWidth(4.5);
	pad->Draw();

        const int n =100;
	double sum = 0, average = 0;
        Double_t bfxval[n], bfxerr[n], bfval[n], bferr[n];
        ifstream openfile;
        openfile.open("../CalRelativeDiff/RelativeDiff_0_0.txt");
        for ( Int_t i = 0; i<n; i++){
            bfxval[i] = i;
            bfxerr[i] = 0.000001;
        }

        for (Int_t i = 0; i<n; i++) {
            openfile>>bfval[i];
	    sum +=bfval[i];
            bferr[i] = 0.000001;
        }

	average = sum/n;

        TGraphErrors *graph = new TGraphErrors(n, bfxval, bfval, bfxerr, bferr);
        graph->GetYaxis()->SetRangeUser(0.00,0.12);
        graph->GetXaxis()->SetRangeUser(0,102);
        graph->GetXaxis()->SetTitle("Number");
        graph->GetYaxis()->SetTitle("Difference");
        graph->GetYaxis()->SetDecimals();
        graph->SetMarkerStyle(20);
        graph->SetMarkerColor(2);
        graph->SetLineColor(2);
        graph->GetXaxis()->CenterTitle();
        graph->GetYaxis()->CenterTitle();

        graph->Draw("AP");
        graph->Fit("pol0");

        TF1 *f = graph->GetFunction("pol0");
        f->SetLineWidth(1);
        openfile.close();

        cout << "Average brach fraction: " << average << endl;

         // RooRealVar RelativeDiff("RelativeDiff","",0.03,0.11);

	 // RooArgSet mchic_etapipi;
	 // mchic_etapipi.add(RooArgSet(RelativeDiff));
	 // RooDataSet *Distribution= RooDataSet::read("../CalRelativeDiff/RelativeDiff_0_0.txt",mchic_etapipi,"Q");
	 // //cout<<__LINE__<<endl;
         // RooRealVar mean("mean", "mean", 0.09, 0.03,0.11);
	 // RooRealVar sigma("sigma", "sigma", 0.01, 0, 1);
         // RooGaussian gauss("gauss", "gauss", RelativeDiff, mean, sigma);

	 // RooRealVar nsig("nsig","#sig events", 100., 0., 300.);

	 // RooAddPdf model("model", "g", RooArgList(gauss), RooArgList(nsig));
	 // RooPlot* xframe = RelativeDiff.frame(Title("Relative Difference")) ; 
	 // model.fitTo(*Distribution, Minos(kTRUE),Extended(),Strategy(2));

	 // xframe->GetXaxis()->SetTitle("Relative Difference");
         // xframe->GetYaxis()->SetTitle("Times");
	 // xframe->GetXaxis()->CenterTitle(1);
	 // xframe->GetXaxis()->SetDecimals(1);
	 // xframe->GetXaxis()->SetTitleSize(0.05);
	 // xframe->SetTitleOffset(1.25,"X");
	 // xframe->GetYaxis()->CenterTitle(1);
	 // xframe->GetYaxis()->SetLabelSize(0.06);
	 // xframe->GetYaxis()->SetTitleSize(0.07);
	 // xframe->SetTitleOffset(0.85,"Y");

	 // Distribution->plotOn(xframe,Binning(100),MarkerColor(kBlack),LineWidth(1));
	 // model.plotOn(xframe, Components("gauss"), LineStyle(2),LineColor(kBlack));
	 // model.paramOn(xframe, Layout(0.55, 0.9, 0.9), Format("NEU", AutoPrecision(2)));
	 // model.plotOn(xframe);
         // cout<<"mean= "<<mean.getVal()<<" +- "<<mean.getError()<<endl;
         // cout<<"sigma= "<<sigma.getVal()<<" +- "<<sigma.getError()<<endl;

	 // xframe->Draw();
	
        leg = new TLegend(0.70,0.65,0.88,0.75);
        leg->SetHeader("(a)");
        leg->SetLineColor(0);
        leg->SetFillColor(0);
        leg->Draw();

	c->Print("RelativeDiff_0_0.eps");
}
