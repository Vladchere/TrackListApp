//
//  TrackListViewController.swift
//  TrackListApp
//
//  Created by Vladislav on 15.04.2021.
//

import UIKit

class TrackListViewController: UITableViewController {

	var trackList = Track.getTrackList()

	override func viewDidLoad() {
		super.viewDidLoad()

		tableView.rowHeight = 65
		navigationItem.leftBarButtonItem = editButtonItem
	}

	// MARK: - Table view data source
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		trackList.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "trackName", for: indexPath)

		cell.textLabel?.text = trackList[indexPath.row].song
		cell.textLabel?.numberOfLines = 0
		cell.detailTextLabel?.text = trackList[indexPath.row].artist
		cell.imageView?.image = UIImage(named: trackList[indexPath.row].name)

		return cell
	}

	// MARK: - Table view delegate

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let track = trackList[indexPath.row]

		performSegue(withIdentifier: "showDetails", sender: track)
	}

	override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		let currentTrack = trackList.remove(at: sourceIndexPath.row)
		trackList.insert(currentTrack, at: destinationIndexPath.row)
	}

	override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
		.none
	}

	override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
		false
	}

	// MARK: - Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showDetails" {
			let trackDetailsVC = segue.destination as! TrackDetailsViewController
			trackDetailsVC.track = sender as? Track
		}
	}
}
