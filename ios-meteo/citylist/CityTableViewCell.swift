import Foundation
import UIKit

public class CityTableViewCell: UITableViewCell {
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    public var tapCallBack: ((Int)->())!
    public var id:Int!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tap))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func tap() {
        self.tapCallBack(self.id)
    }
}
