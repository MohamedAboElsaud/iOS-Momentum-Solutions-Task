//
//  HomeViewController.swift
//  iOS Momentum Solutions Task
//
//  Created by mohamed ahmed on 23/07/2025.
//

import UIKit
import Combine


class HomeViewController: UIViewController, HomeView {

    private var cancellables = Set<AnyCancellable>() // Store subscriptions to prevent premature cancellation

    var homePresenter : HomeViewPresenter!

    private let homeFeedTable: UITableView = {
        let table = UITableView()
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        homePresenter = HomeViewPresenter(self)

        view.backgroundColor = .systemBackground

        view.addSubview(homeFeedTable)
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self

        configureNavbar()

        let headerView = MainHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 210))
        homeFeedTable.tableHeaderView = headerView

    }




    private func configureNavbar(){

        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)

        ]

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }

}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return homePresenter.sectionTitles.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return homePresenter.sectionTitles[section]
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        header.textLabel?.textColor = .label
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier) as? CollectionViewTableViewCell  else {return UITableViewCell() }


               homePresenter.returnMovieArray(with: cell, at: indexPath)
               //cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        230
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        80
    }

    func reloadTableView() {
        DispatchQueue.main.async {
            self.homeFeedTable.reloadData()
        }
    }
}
