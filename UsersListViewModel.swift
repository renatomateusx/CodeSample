import Foundation

class UsersListViewModel {
    private let alertPresenter: AlertPresenter
    private let usersService: UsersListService
    var updateLoadingState: ((LoadingState) -> Void)?
    weak var delegate: UsersListViewModelDelegate?
    private let errorTitle = "Error!"
    private let errorMessage = "We were not able to fetch users list. Do you want to try again?\n(Error code: %d)"

    init(alertPresenter: AlertPresenter,
         usersService: UsersListService) {
        self.alertPresenter = alertPresenter
        self.usersService = usersService
    }

    func fetchUsers() {
        self.updateLoadingState?(.loading)
        usersService.fetchUsers { [weak self] result in 
            guard let self = self else { return }
            self.updateLoadingState?(.normal)
            switch result {
                case .success(let users): 
                let sortedUsers = users.sorted { $0.name < $1.name }
                self.delegate?.viewModel(self, didFetchUsersList: sortedUsers)
                case .failure(let error):
                let customErrorMessage = String(format: self.errorMessage, error.code)
                    self.alertPresenter.presentDecisionAlert(title: self.errorTitle, 
                                                             message: customErrorMessage, 
                    onYes: { [weak self] in
                        guard let self = self else { return }
                        self.fetchUsers()
                    }, 
                    onNo: { [weak self] in
                        guard let self = self else { return }
                        self.delegate?.viewModelCloseList(self)
                    })
            }
        }
    }
}
