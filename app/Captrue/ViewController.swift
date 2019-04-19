//
//  ViewController.swift
//  Teste
//
//  Created by Carlos Doki on 07/04/19.
//  Copyright © 2019 Carlos Doki. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase
import FirebaseFirestore
import CoreImage
import Alamofire

class ViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    
    
    @IBOutlet var cameraPreview: UIView!
    @IBOutlet var captureImageView: UIImageView!
    @IBOutlet var activeView: UIView!
    @IBOutlet var activeAIV: UIActivityIndicatorView!
    
    var captureSession: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    let sentimento: [String] = ["Cansado", "Feliz", "Triste", "Ansiedade", "Embriagues"]
    let tipo: [String] = ["entrada", "saida"]
    let number = Int.random(in: 0 ... 4)
    let number2 = Int.random(in: 0 ... 1)
    let number3 = Int.random(in: 0 ... 3)
    let colaborador : [String] = ["mDWfG5jWqHpzUzK52Gc6", "9gUVxwKm8r1NpuJYw3bF", "fiuexer8rJi4KA47DWQf", "0L9UghXcQib4ZdpEgwZa"]
    
//    {
//        "custom_classes" = 5;
//        images =     [
//            {
//                classifiers =             [
//                    {
//                        classes =                     [
//                            {
//                                class = Triste;
//                                score = "0.893";
//                            }
//                        ];
//                        "classifier_id" = "BTP_951803699";
//                        name = BTP;
//                    }
//                ];
//                "resolved_url" = "https://firebasestorage.googleapis.com/v0/b/captrue-fe9e2.appspot.com/o/158C3DCC-22B1-45CC-B944-567F3372DB99.jpg?alt=media";
//                "source_url" = "https://firebasestorage.googleapis.com/v0/b/captrue-fe9e2.appspot.com/o/158C3DCC-22B1-45CC-B944-567F3372DB99.jpg?alt=media";
//            }
//        ];
//        "images_processed" = 1;
//    }
    struct Classes2: Decodable {
        let classes: String
        let score: Decimal
        
        enum CodingKeys : String, CodingKey {
            case classes = "class"
            case score = "score"
        }
    }
    
    struct Watson: Decodable {
        let images: [Images]
        let images_processed: Int
        let custom_classes: Int
    }
    
    struct Images: Decodable {
        let classifiers: [Classifiers]
        let source_url: String
        let resolved_url: String
    }
    
    struct Classifiers: Decodable {
        let classifier_id: String
        let name: String
        let classes: [Classes2]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        activeAIV.stopAnimating()
        activeView.isHidden = true
        
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .medium
        
        guard let backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .front)
            else {
                print("Unable to access back camera!")
                return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            
            stillImageOutput = AVCapturePhotoOutput()
            
            if captureSession.canAddInput(input) && captureSession.canAddOutput(stillImageOutput) {
                captureSession.addInput(input)
                captureSession.addOutput(stillImageOutput)
                setupLivePreview()
                //                sleep(4)
                //                let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
                //                stillImageOutput.capturePhoto(with: settings, delegate: self)
            }
        }
        catch let error  {
            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
        }
    }
    
    func setupLivePreview() {
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        videoPreviewLayer.videoGravity = .resizeAspect
        videoPreviewLayer.connection?.videoOrientation = .portrait
        cameraPreview.layer.addSublayer(videoPreviewLayer)
        
        DispatchQueue.global(qos: .userInitiated).async { //[weak self] in
            self.captureSession.startRunning()
            DispatchQueue.main.async {
                self.videoPreviewLayer.frame = self.cameraPreview.bounds
            }
        }
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        activeAIV.startAnimating()
        activeView.isHidden = false
        
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        stillImageOutput.capturePhoto(with: settings, delegate: self)
        
        
//         let downloadUrl = "https://firebasestorage.googleapis.com/v0/b/captrue-fe9e2.appspot.com/o/0972B72D-EE1F-4B8B-B332-663FB1C9DBDC.jpg?alt=media&token=240e854d-5457-4fba-a3cf-f82b8fc077ae"
//        let session = URLSession.shared
//        let imageURL = URL(string: "https://gateway.watsonplatform.net/visual-recognition/api/v3/classify?url=\(downloadUrl)&version=2018-03-19&classifier_ids=BTP_951803699")
//
//        var request = URLRequest(url: imageURL!)
//        request.httpMethod = "GET"
//        request.setValue("Basic YXBpa2V5OmlqaXFWLTNhSFgzdXVpaTZ0RHA2YXYtNE9pRnRycXJNWlplbkhXVmp4bWVR", forHTTPHeaderField: "Authorization")
//
//        let task = session.dataTask(with: request) { data, response, error in
//
//            if error == nil {
//                let responseData = String(data: data!, encoding: String.Encoding.utf8)
//                let user = try! JSONDecoder().decode(Watson.self, from: data!)
//                print(user.images[0].classifiers[0].classes[0].classes)
//                print(user.images[0].classifiers[0].classes[0].score)
//            }
//        }
//        task.resume()
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        guard let imageData = photo.fileDataRepresentation()
            else { return }
        
        let image = UIImage(data: imageData)
        captureImageView.image = image
        
        // Get a reference to the storage service using the default Firebase App
        let storage = Storage.storage()
        
        // Create a root reference
        let storageRef = storage.reference()
        
        var data = Data()
        data = captureImageView!.image!.jpegData(compressionQuality: 0.75)!
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        let imguid = NSUUID().uuidString
        
        storageRef.child("\(imguid).jpg").putData(data, metadata:metaData) { (metadata, error) in
            if error != nil {
                print("DOKI: Unabled to upload to Firebase storage")
            } else {
                print("DOKI: Successfully uploaded image to Firebase storage")
                storageRef.child("\(imguid).jpg").downloadURL { url, error in
                    if let error = error {
                        print("erro\(error)")
                    } else {
                        let downloadUrl = (url)!
                        
                        // success!
                        let session = URLSession.shared
                        let imageURL = URL(string: "https://gateway.watsonplatform.net/visual-recognition/api/v3/classify?url=\(downloadUrl)&version=2018-03-19&classifier_ids=BTP_951803699")
                        
                        var request = URLRequest(url: imageURL!)
                        request.httpMethod = "GET"
                        request.setValue("Basic YXBpa2V5OmlqaXFWLTNhSFgzdXVpaTZ0RHA2YXYtNE9pRnRycXJNWlplbkhXVmp4bWVR", forHTTPHeaderField: "Authorization")
                        
                        let task = session.dataTask(with: request) { data, response, error in
                            
                            if error == nil {
                                let user = try! JSONDecoder().decode(Watson.self, from: data!)
                                let sentimento = user.images[0].classifiers[0].classes[0].classes
                                let score = user.images[0].classifiers[0].classes[0].score
                            
                                let dateFormatter = DateFormatter()
                                dateFormatter.calendar = Calendar(identifier: .iso8601)
                                dateFormatter.dateFormat = "dd/MM/yyyy"
                                let strData = dateFormatter.string(from: Date())
                                
                                dateFormatter.dateFormat = "HH:mm"
                                let strHora = dateFormatter.string(from: Date())
                                
                                let db = Firestore.firestore()
                                var ref: DocumentReference? = nil
                                ref = db.collection("colaborador").document("\(self.colaborador[self.number3])").collection("ponto").addDocument(data: [
                                    "data": "\(strData)",
                                    "hora": "\(strHora)",
                                    "foto": "\(url!)",
                                    "sentimento" : "\(sentimento)",
                                    "score" : score,
                                    "tipo" : "\(self.tipo[self.number2])"
                                ]) { err in
                                    if let err = err {
                                        print("Error adding document: \(err)")
                                    } else {
                                        print("Document added with ID: \(ref!.documentID)")
                                    }
                                }
                                //
                                self.captureSession.stopRunning()

                                self.performSegue(withIdentifier: "tarefas", sender: nil)

                            }
                            self.activeAIV.stopAnimating()
                            self.activeView.isHidden = true
                        }
                        task.resume()
                    }
                }
            }
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.captureSession.stopRunning()
    }
    
    func convert(cmage:CIImage) -> UIImage
    {
        let context:CIContext = CIContext.init(options: nil)
        let cgImage:CGImage = context.createCGImage(cmage, from: cmage.extent)!
        let image:UIImage = UIImage.init(cgImage: cgImage)
        return image
    }
    
    func fixOrientation(img: UIImage) -> UIImage {
        var transform = CGAffineTransform.identity
        transform = transform.translatedBy(x: 0, y: img.size.height)
        transform = transform.rotated(by: CGFloat(-Double.pi/2))
        let ctx = CGContext(data: nil, width: Int(img.size.width), height: Int(img.size.height), bitsPerComponent: img.cgImage!.bitsPerComponent, bytesPerRow: 0, space: img.cgImage!.colorSpace!, bitmapInfo: img.cgImage!.bitmapInfo.rawValue)
        
        ctx!.concatenate(transform);
        ctx?.draw(img.cgImage!, in: CGRect(origin: .zero, size: CGSize(width: img.size.height, height: img.size.width)))
        let cgimg = ctx!.makeImage()
        let img = UIImage(cgImage: cgimg!)
        
        
        UIGraphicsBeginImageContextWithOptions(img.size, false, img.scale)
        let rect = CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height)
        img.draw(in: rect)
        
        
        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return normalizedImage
    }
}
