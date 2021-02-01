//
//  BlueRHTViewController.swift
//  burger
//
//  Created by ELA Innovation on 14/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import UIKit
import Charts
class BlueRHTViewController: UIViewController,ChartViewDelegate {

    var lineChart = LineChartView()
      
      
      
      
      
      
      
      
      override func viewDidLoad() {
          super.viewDidLoad()
          view.backgroundColor = .cyan
          lineChart.delegate = self
          
      }
      
      override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          
          
            lineChart.frame = CGRect(x: 0, y: 0,
                                       width: self.view.frame.size.width, height:self.view.frame.size.width)
            lineChart.center = view.center
            view.addSubview(lineChart)
            
            var entries = [ChartDataEntry]()
            
            for x in 0..<10
            {
                entries.append(ChartDataEntry(x: Double(x),y: Double(x)))
            }
            
            let set = LineChartDataSet(entries:entries)
            set.colors = ChartColorTemplates.material()
            
            let data = LineChartData(dataSet: set)
            
            lineChart.data = data
          
      }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
