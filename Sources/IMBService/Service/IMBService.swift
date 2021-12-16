import Foundation

public struct IMBService {

    public let session: URLSessionProtocol

    public init(session: URLSessionProtocol) {
        self.session = session
    }

    func makeRequest<Request: URLRequestConvertible>(request: Request,
                                                     completion: @escaping ServiceCompletion<Request.ResponseModel>) {
        session.dataTask(with: request) { data, response, error in
            let serviceResult: ServiceResult<Request.ResponseModel>
            if let error = error {
                serviceResult = .failure(ServiceError(withError: error))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(Request.ResponseModel.self, from: data)
                    serviceResult = .success(response)
                } catch {
                    serviceResult = .failure(.unknown)
                }
            } else {
                serviceResult = .failure(.unknown)
            }
            DispatchQueue.main.async {
                completion(serviceResult)
            }
        }.resume()
    }
}
