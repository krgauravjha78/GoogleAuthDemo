//
//  PDFViewController.swift
//  DemoApplicationAuth
//
//  Created by Gaurav Kumar on 13/09/20.
//  Copyright © 2020 Gaurav Kumar. All rights reserved.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var btnSharePDF: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var pdfView: UIView!
    
    //MARK:- Variable Declaration
    var pdfUrl = String()
    var selectedIndex = Int()
    var selectedData = [String:String]()
    
    //MARK:- View Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblHeader.text = selectedData["CompanyName"]
        //Sample PDF Url to share from device.
        pdfUrl = "https://gahp.net/wp-content/uploads/2017/09/sample.pdf"
        
        let pdfView = PDFView(frame: self.pdfView.bounds)
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.pdfView.addSubview(pdfView)
        pdfView.autoScales = true
        let pdfURL = URL(string: pdfUrl)
        pdfView.document = PDFDocument(url: pdfURL!)
    }
    
    //MARK:- Button Action
    @IBAction func btnSharePDFClicked(_ sender: Any) {
        let pdfURL = URL(string: pdfUrl)
        let pdfDocument = NSData(contentsOf: pdfURL!)
        let activityVc = UIActivityViewController(activityItems: [pdfDocument!], applicationActivities: nil)
        activityVc.popoverPresentationController?.sourceView = self.view
        self.present(activityVc,animated: true,completion: nil)
    }
    

    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
    

