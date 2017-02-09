//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Fiori III, Anthony J on 2/1/17.
//  Copyright © 2017 Fiori III, Anthony J. All rights reserved.
//

import UIKit
import MapKit

//Map Controller
class MapViewController: UIViewController{
    
    var mapView: MKMapView!
    
//LOAD VIEW OVERRIDE FUNCTION
    override func loadView(){
        // Create a map view
        mapView = MKMapView()
        
        //Set it as *the* view of this view controller
        view = mapView
        
        let segmentedControl
            = UISegmentedControl(items: ["Standard","Hybrid", "Satellite"])
        segmentedControl.backgroundColor
            = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_: )), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint
            = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        
        let leadingConstraint
            = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
        let trailingConstraint
            = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
    }
    
    func mapTypeChanged(_ segControl: UISegmentedControl){
        
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
//VIEW DID LOAD OVERRIDE FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Prints to Console
        print ("MapViewController loaded its view.")
        
    }

    
}



//Conversion Controller
class ConversionViewController: UIViewController{
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
 
//Measurement FahrenheitValue
    var fahrenheitValue: Measurement<UnitTemperature>?{
        didSet{
            updateCelsiusLabel()
        }
    }
    
//Measurement CelsiusValue
    var celsiusValue: Measurement<UnitTemperature>?{
        if let fahrenheitValue = fahrenheitValue{
            return fahrenheitValue.converted(to: .celsius)
        }
        else{
            return nil
        }
    }
    
//Action Fahrenheight Field Editing Chnaged
    @IBAction func fahrenheightFieldEditingChanged(_ textField: UITextField){
        
        if let text = textField.text, let value = Double(text){
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        }
        else{
            fahrenheitValue = nil
        }
    }
    
//Action Function To Dissmiss Keyboard
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
    
    
//UpdateCelsiusLabel Function
    func updateCelsiusLabel(){
        if let celsiusValue = celsiusValue{
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        }
        else{
            celsiusLabel.text = "???"
        }
        
    }
    
//Number Formate Function
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
//TextField Function
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,replacementString string: String)-> Bool{
        
        //  let existingTextHasDecimalSeparator = textField.text? .range(of: ".")
        //  let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? ","
        
        let existingTextHasDecimalSeparator
            = textField.text?.range(of: decimalSeparator)
        
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
        
        if existingTextHasDecimalSeparator != nil,
         replacementTextHasDecimalSeparator != nil{
            return false
        }
        else{
            return true
        }
    }
    
//OVERRIDE Function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Prints to Console
        print ("ConversionViewController loaded its view.")
        updateCelsiusLabel()
    }
    
}
