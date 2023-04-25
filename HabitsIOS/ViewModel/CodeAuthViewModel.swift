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
    
    @Published private(set) var codeToSend: String = ""
    
    @Published var companyModel = Company.initalState()
    let httpClient:  HTTPClient = HTTPClient()
    
     func modifyCode (newValue: String) -> Void {
        

        
        if(newValue.count < 8) {
            if (newValue.count == 3 && newValue.count > codeToSend.count) {
                code = newValue.uppercased() + "-"
                codeToSend = newValue.uppercased() + "-"
            } else {
                code = newValue.uppercased()
                codeToSend = newValue.uppercased()
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
    
    
    func getItemsArea () -> [PickerModel] {
        var AreaFilters: [PickerModel] = []
        guard companyModel.filter_category.count > 0 else {
            
            print("company filter is not defined in this moment")
            return AreaFilters
        }
        
        companyModel.filter_category[0].filter!.forEach { item in
            AreaFilters.append(PickerModel(id: item._id, label: item.name))
        }
        
        return AreaFilters
    }
    
    
    func getItemsAge () -> [PickerModel] {
        var AreaFilters: [PickerModel] = []
        guard companyModel.filter_category.count > 1 else {
            
            print("company filter is not defined in this moment")
            return AreaFilters
        }
        
        companyModel.filter_category[1].filter!.forEach { item in
            AreaFilters.append(PickerModel(id: item._id, label: item.name))
        }
        
        return AreaFilters
    }



    
    func verifyCode () -> Void {
        code = code.uppercased()
    
        httpClient.sendRequest(
            url: "https://apiv2desarrollo.habits.ai/api/company/one?where[key]=\(code)",
            method: "GET",
            body: nil,
            completion: convertToHTTPResponse )
    }
}
