//
//  FileManager.swift
//  Salwador
//
//  Created by Ailiniyazi Maimaiti on 21.02.23.
//

import Foundation

class FileManagerService {
    func getFilePath(fileName: String, fileType: String) -> String {
        Bundle.main.path(forResource: fileName, ofType: fileType) ?? ""
    }

    func getFileURL(filePath: String) -> URL {
        URL(fileURLWithPath: filePath)
    }

    func readFile(fileName: String, fileType: String) -> Data? {
        let filepath = getFilePath(fileName: fileName, fileType: fileType)
        let fileurl = getFileURL(filePath: filepath)

        do {
            let data = try Data(contentsOf: fileurl)
            return data
        } catch {
            print(error)
        }

        return nil
    }

    func getApiKey() -> String {
        let data = readFile(fileName: "APIKey", fileType: "json")
        do {
            let json = try JSONDecoder().decode(APIJSONModel.self, from: data!)
            return json.apikey
        } catch {
            return ""
        }
    }
}
