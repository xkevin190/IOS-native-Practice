//
//  CodeAuthViewModel.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 21/4/23.
//

import Foundation


class CodeAuthViewModel: ObservableObject {
    @Published var code = ""
    @Published var showOthersInputs = true
    
    @Published var companyModel = Company.initalState()
    let httpClient:  HTTPClient = HTTPClient()
    
    func modifyCode (newValue: String) -> Void {
        
        code = newValue.uppercased()
        
        if(newValue.count < 8) {
            if (newValue.count == 3) {
                code += "-"
            }
        }
        else {
            let result = code.prefix(7)
            code = String(result)
        }
    }
    
    
    func convertToHTTPResponse(_ result: Result<Data?, Error>) -> Void {
        switch result {
        case .success(let data):
            do {
                let httpResponse = try JSONDecoder().decode(HTTPResponse<Company>.self, from: data!)
                DispatchQueue.main.async {
                    self.companyModel = httpResponse.data ?? Company.initalState()
                }
            } catch let error {
                print("this json Couldn't decode", error)
            }
        case .failure(let error):
            print("error", error)
        }
    }



    
    func verifyCode () -> Void {
        code = code.uppercased()
        
        print("companyID", companyModel._id)
        

        httpClient.sendRequest(
            url: "https://apiv2desarrollo.habits.ai/api/company/one?where[key]=\(code)",
            method: "GET",
            body: nil,
            completion: convertToHTTPResponse )
    }
}
