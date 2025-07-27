//
//  UpComingViewController.swift
//  iOS Momentum Solutions Task
//
//  Created by mohamed ahmed on 23/07/2025.
//

import UIKit

final class UpcomingViewController: UIViewController {

    private var titles: [Title] = [Title]()

    private let upcomingTable: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(upcomingTable)

        title = "Upcoming"

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        upcomingTable.dataSource = self
        upcomingTable.delegate = self

        fetchUpcomings()

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }

    private func fetchUpcomings() {
        Networking.shared.getDiscoverdMovies(with:  #"movie/upcoming"#) { [weak self] result in
            switch result {
            case .success(let title):
                self?.titles = title
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
    }
}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier,for: indexPath) as? TitleTableViewCell else {return UITableViewCell()}

        cell.configure(with: titles[indexPath.row])

        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let title = titles[indexPath.row]
        guard (title.originalTitle ?? title.originalName) != nil else { return }
        guard title.overview != nil else { return }

        let detailVC = TitlePreviewViewController(movie: title) { [weak self] updatedMovie in
              guard let self = self else { return }
            if let index = self.titles.firstIndex(where: { $0.id == updatedMovie.id }) {
                self.titles[index] = updatedMovie
                tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: UITableView.RowAnimation.automatic)
            }
          }
        navigationController?.pushViewController(detailVC, animated: true)

    }
}

