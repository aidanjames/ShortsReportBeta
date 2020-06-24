//
//  LocationManager.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 24/06/2020.
//

import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    private let manager = CLLocationManager()
    
    var completion: ((CLLocation) -> Void)? = nil
    
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
        
    }
    
    
    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    
    func stop() {
        manager.stopUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            if let completion = completion {
                completion(firstLocation)
                self.stop()
            }
        }
    }

}

extension LocationManager {
    
    func getPlace(for location: CLLocation, completion: @escaping (CLPlacemark?) -> Void) {
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            
            guard error == nil else {
                print("*** Error in \(#function): \(error!.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let placemark = placemarks?[0] else {
                print("*** Error in \(#function): placemark is nil")
                completion(nil)
                return
            }
            completion(placemark)
        }
    }
}
