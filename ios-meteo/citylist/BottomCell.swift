import Foundation
import UIKit

public class BottomCell: UITableViewCell {

    @IBOutlet weak var switchDegreeButton: UIButton!
    @IBOutlet weak var addCityButton: UIButton!
    
    public var switchDegreeCallBack: (()->())!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction func switchDegreeClick(_ sender: Any) {
        switchDegreeCallBack()
    }
    
    @IBAction func addCityClick(_ sender: Any) {
        
    }
    
}
