//
//  TrackDetailsViewController.swift
//  TrackListApp
//
//  Created by Vladislav on 15.04.2021.
//

import UIKit

class TrackDetailsViewController: UIViewController {

	@IBOutlet var artCoverImageView: UIImageView!
	@IBOutlet var trackNameLabel: UILabel!

	var track: Track!

	override func viewDidLoad() {
		super.viewDidLoad()
		artCoverImageView.image = UIImage(named: track.name)
		trackNameLabel.text = track.name
	}
}
