//
//  FileStorage.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 8/5/23.
//

import Foundation
import ProgressHUD
import FirebaseStorage

let storage = Storage.storage()


class FileStorage {
    
    //MARK: - Images
    class func uploadImage(_ image: UIImage, directory: String, completion: @escaping (_ documentLink: String?) -> ()) {
        
        let storageRef = storage.reference(forURL: Key.fileReferance.rawValue).child(directory)
        
        guard let imageData = image.jpegData(compressionQuality: 1) else {
            return
        }
        
//        let imageName = UUID().uuidString
        var task:  StorageUploadTask!
        
        task = storageRef.putData(imageData, metadata: nil, completion: { metaData, error in
            
            task.removeAllObservers()
            ProgressHUD.dismiss()
            
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, error in
                
                if let error = error {
                    // Handle error if download URL retrieval fails
                    print("Error downloading url: \(error.localizedDescription)")
                    return
                }
                
                guard let downloadUrl = url else {
                    completion(nil)
                    return
                }
                
                completion(downloadUrl.absoluteString)
            }
        })
        
        task.observe(.progress) { snapshot in
            let progress = snapshot.progress!.completedUnitCount / snapshot.progress!.totalUnitCount
            ProgressHUD.showProgress(CGFloat(progress))
        }
    }
    
    class func downloadImage(imageUrl: String, completion: @escaping(_ image: UIImage?) -> ()) {
                
        let imageFileName = fileNameFrom(FileUrl: imageUrl)
        if fileExistAtPath(path: imageFileName) {
            if let contentOfFile = UIImage(contentsOfFile: fileInDocumentsDirectory(fileName: imageFileName)) {
                
                completion(contentOfFile)
            } else {
                completion(UIImage(named: "user"))
            }
        } else {
            
            if imageUrl != "" {
                let docUrl = URL(string: imageUrl)
                let downloadQueue = DispatchQueue(label: "imageDownloadQueue")
                downloadQueue.async {
                    let data = NSData(contentsOf: docUrl!)
                    
                    if let data = data {
                        FileStorage.saveFielocally(fileData: data, fileName: imageFileName)
                        
                        DispatchQueue.main.async {
                            completion(UIImage(data: data as Data))
                        }
                        
                    } else {
                        DispatchQueue.main.async {
                            completion(nil)
                        }
                    }
                }
            }
        }
    }
    
    //MARK: - SaveimageLocally
    class func saveFielocally(fileData: NSData, fileName: String) {
        let docUrl = getDocumentsUrl().appending(path: fileName, directoryHint: .notDirectory)
        fileData.write(to: docUrl, atomically: true)
    }
}



//MARK: - Helpers
func getDocumentsUrl() -> URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
}

func fileInDocumentsDirectory(fileName: String) -> String {
    return getDocumentsUrl().appendingPathComponent(fileName).path(percentEncoded: true)
}

func fileExistAtPath(path: String) -> Bool {
 
    let filePath = fileInDocumentsDirectory(fileName: path)
    let fileManager = FileManager.default
    
    return fileManager.fileExists(atPath: filePath)
}

//take the path of file and return its user id
func fileNameFrom(FileUrl: String) -> String {
    return ((FileUrl.components(separatedBy: "_").last)!.components(separatedBy: "?").first)!.components(separatedBy: ".").first!
}
