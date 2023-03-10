import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var relaseLabel: UILabel!
    
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.layer.cornerRadius = 7.0
        movieImage.backgroundColor = .darkGray
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func movieDataFetch (movie: Movie){
        let url = URL(string: "\(API().imageURL)\(movie.posterPath ?? "")")
        DispatchQueue.main.async {
            self.movieImage.kf.setImage(with: url)
        }
        
        self.titleLabel.text = movie.title
        
        let voteAveragaText = Utils.convertDouble(movie.voteAverage, maxDecimals: 2)
        self.voteAverageLabel.text = "\(voteAveragaText)/10"
        
        self.relaseLabel.text = Utils.formattedDateFromString(dateString: movie.releaseDate ?? "", withFormat: "dd.MM.yyyy")
    }
}
