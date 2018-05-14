//
//  ViewController.swift
//  Test chart
//
//  Created by seyed amin akbarzade miri on 4/18/18.
//  Copyright © 2018 seyed amin akbarzade miri. All rights reserved.
//

import UIKit
import Charts
/// an small change to check the commit on git hub
class ViewController: UIViewController,ChartViewDelegate
{
    @IBOutlet weak var number1: UISlider!
    @IBOutlet weak var number2: UISlider!
    @IBOutlet weak var number3: UISlider!
    @IBOutlet weak var sldLineOffset: UISlider!
    @IBOutlet weak var sldlineLength: UISlider!

    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var barChart: BarChartView!
    @IBOutlet weak var lineChart: LineChartView!
    @IBOutlet weak var horizontalBarChart: HorizontalBarChartView!
    @IBOutlet weak var ScatterChart: ScatterChartView!
    @IBOutlet weak var CandleStickChart: CandleStickChartView!
    @IBOutlet weak var BubbleChart: BubbleChartView!
    @IBOutlet weak var RadarChart: RadarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let view = UIView(frame: CGRect(x: 5, y: 5, width: 5, height: 5))
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?)
    {
        self.renderCharts()
    }
    
    
    @IBAction func renderCharts()
    {
        self.pieChartUpdate()
//        self.barChartUpdate()
//        self.lineChartUpdate()
//        self.horizontalBarChartUpdate()
//        self.scatterChartUpdate()
//        self.candleStickChartUpdate()
//        self.bubbleChartUpdate()
//        self.radarChartUpdate()
    }
    
    
    func pieChartUpdate ()
    {
        //future home of pie chart code
        let entry1 = PieChartDataEntry(value: Double(number1.value), label: "#1")
        let entry2 = PieChartDataEntry(value: Double(number2.value), label: "#2")
        let entry3 = PieChartDataEntry(value: Double(number3.value), label: "#3")
//        let entry4 = PieChartDataEntry(value: Double(number1.value), label: "#4")
//        let entry5 = PieChartDataEntry(value: Double(number2.value), label: "#5")
//        let entry6 = PieChartDataEntry(value: Double(number3.value), label: "#6")
//        let entry7 = PieChartDataEntry(value: Double(number1.value), label: "#7")
//        let entry8 = PieChartDataEntry(value: Double(number2.value), label: "#8")
//        let entry9 = PieChartDataEntry(value: Double(number3.value), label: "#9")
//        let entry10 = PieChartDataEntry(value: Double(number1.value), label: "#10")

        let dataSet = PieChartDataSet(values: [entry1, entry2, entry3/*, entry4, entry5, entry6, entry7, entry8, entry9, entry10 */], label: "Widget Types")
        
        dataSet.colors = ChartColorTemplates.joyful()
        dataSet.label = "hihihi"
//        dataSet.sli
//        dataSet.notifyDataSetChanged()
        dataSet.valueColors = [UIColor.black]
        dataSet.sliceSpace = 0 /// az khode dayere kam mikone :(
        dataSet.selectionShift = 18 /// meghdari ke az dayere bezane biron vaghti select mishe
        dataSet.yValuePosition = .outsideSlice
        dataSet.valueLineColor = UIColor.orange
        dataSet.valueLineWidth = 2
        dataSet.valueLinePart1OffsetPercentage = CGFloat(self.sldLineOffset.value)
        dataSet.valueLinePart1Length = CGFloat(self.sldlineLength.value)
        dataSet.valueLinePart2Length = 0.4
        dataSet.valueLineVariableLength = false
        dataSet.entryLabelFont = nil
        dataSet.entryLabelColor = UIColor.brown
//        dataSet.highlightColor = UIColor.white
        
        let data = PieChartData(dataSet: dataSet)
        /// dayere faghat index 0 dare. index haye dige nill mishe
        let a = data.getDataSetByIndex(1)
        let b = data.getDataSetByLabel("hihihi", ignorecase: false)
//        let c = data.entryForHighlight(self.pieChart.highlighted)
        pieChart.data = data
//        pieChart.data = PieChartData(dataSet: PieChartDataSet(values: [entry1, entry2, entry3], label: "nemodar dayeree"))
        self.pieChart.chartDescription?.text = "Share of Widgets by Type"
        
        /// baraye animate dadan be chart
        self.pieChart.animate(yAxisDuration: 0.3)
        //This must stay at end of function
        self.pieChart.notifyDataSetChanged()
        self.pieChart.delegate = self
    }
    
    func barChartUpdate ()
    {
        //future home of bar chart code
        let entry1 = BarChartDataEntry(x: 1.0, y: Double(number1.value))
        let entry2 = BarChartDataEntry(x: 2.0, y: Double(number2.value))
        let entry3 = BarChartDataEntry(x: 3.0, y: Double(number3.value))
        let entry4 = BarChartDataEntry(x: 4.0, y: Double(number1.value))
        let entry5 = BarChartDataEntry(x: 5.0, y: Double(number2.value))
        let entry6 = BarChartDataEntry(x: 6.0, y: Double(number3.value))
        let entry7 = BarChartDataEntry(x: 7.0, y: Double(number1.value))
        let entry8 = BarChartDataEntry(x: 8.0, y: Double(number2.value))
        let entry9 = BarChartDataEntry(x: 9.0, y: Double(number3.value))
        let entry10 = BarChartDataEntry(x: 10, y: Double(number1.value))

        let dataSet = BarChartDataSet(values: [entry1, entry2, entry3, entry4, entry5, entry6, entry7, entry8, entry9, entry10], label: "Widgets Type")
        let data = BarChartData(dataSets: [dataSet])
        self.barChart.data = data
        self.barChart.chartDescription?.text = "Number of Widgets by Type"
        
        //All other additions to this function will go here
        
        //This must stay at end of function
        self.barChart.notifyDataSetChanged()
    }
    
    
    func lineChartUpdate ()
    {
        let entry1 = ChartDataEntry(x: 1, y: 2)
        let entry2 = ChartDataEntry(x: 3, y: 4)
        let entry3 = ChartDataEntry(x: 5, y: 6)
        let entry4 = ChartDataEntry(x: 7, y: 8)
        let entry5 = ChartDataEntry(x: 9, y: 10)
        
        let dataSet = LineChartDataSet(values:[entry1, entry2, entry3, entry4, entry5], label: "salam lineChart")
        let data = LineChartData(dataSets: [dataSet])
        self.lineChart.data = data
        self.lineChart.chartDescription?.text = "salam lineChart 2"
        self.lineChart.notifyDataSetChanged()
    }
    
    
    func horizontalBarChartUpdate()
    {
        let entry1 = BarChartDataEntry(x: 1.0, y: Double(number1.value))
        let entry2 = BarChartDataEntry(x: 2.0, y: Double(number2.value))
        let entry3 = BarChartDataEntry(x: 3.0, y: Double(number3.value))
        let entry4 = BarChartDataEntry(x: 4.0, y: Double(number1.value))
        let entry5 = BarChartDataEntry(x: 5.0, y: Double(number2.value))

        let dataSet = BarChartDataSet(values: [entry1, entry2, entry3, entry4, entry5], label: "salam horizontalBarChart")
        let data = BarChartData(dataSets: [dataSet])
        self.horizontalBarChart.data = data
        self.horizontalBarChart.chartDescription?.text = "salam horizontalBarChart 2"

        self.horizontalBarChart.notifyDataSetChanged()
    }
    
    
    func scatterChartUpdate ()
    {
        let entry1 = ChartDataEntry(x: 10, y: 20)
        let entry2 = ChartDataEntry(x: 20, y: 30)
        let entry3 = ChartDataEntry(x: 30, y: 40)
        let entry4 = ChartDataEntry(x: 40, y: 50)
        let entry5 = ChartDataEntry(x: 50, y: 60)
        
        let dataSet = ScatterChartDataSet(values: [entry1, entry2, entry3, entry4, entry5], label: "salamScatterChart")
        let data = ScatterChartData(dataSets: [dataSet])
        self.ScatterChart.data = data
        self.ScatterChart.chartDescription?.text = "salamScatterChart 2"
        self.ScatterChart.notifyDataSetChanged()
    }
    
    
    func candleStickChartUpdate()
    {
        let ent = CandleChartDataEntry(x: 10, shadowH: 2.0, shadowL: 5, open: 6, close: 8)
        let entry1 = ChartDataEntry(x: 10, y: 20)
        let entry2 = ChartDataEntry(x: 20, y: 30)
        let entry3 = ChartDataEntry(x: 30, y: 40)
        let entry4 = ChartDataEntry(x: 40, y: 50)
        let entry5 = ChartDataEntry(x: 50, y: 60)
        
        let dataSet = CandleChartDataSet(values:[ent, entry1, entry2, entry3, entry4, entry5], label: "salamCandleStick")
        let data = CandleChartData(dataSets: [dataSet])
        self.CandleStickChart.data = data
        self.CandleStickChart.chartDescription?.text = "salamCandleStick 2"
        self.CandleStickChart.notifyDataSetChanged()
    }
    
    
    func bubbleChartUpdate()
    {
        let entry1 = BubbleChartDataEntry(x: 1, y: 2, size: 3)
        let entry2 = BubbleChartDataEntry(x: 4, y: 5, size: 6)
        let entry3 = BubbleChartDataEntry(x: 7, y: 8, size: 9)
        let entry4 = BubbleChartDataEntry(x: 10, y: 11, size: 12)
        let entry5 = BubbleChartDataEntry(x: 13, y: 14, size: 15)
        
        let dataSet = BubbleChartDataSet(values: [entry1, entry2, entry3, entry4, entry5], label: "salambubbleChart")
        let data = BubbleChartData(dataSets: [dataSet])
        self.BubbleChart.data = data
        self.BubbleChart.chartDescription?.text = "salam bubbleChart 2"
        self.BubbleChart.notifyDataSetChanged()
    }
    
    
    func radarChartUpdate()
    {
        let entry1 = RadarChartDataEntry(value: 1)
        let entry2 = RadarChartDataEntry(value: 2)
        let entry3 = RadarChartDataEntry(value: 3)
        let entry4 = RadarChartDataEntry(value: 4)
        let entry5 = RadarChartDataEntry(value: 5)

        let dataSet = RadarChartDataSet(values: [entry1, entry2, entry3, entry4, entry5], label: "salamRadarChart")
        let data = RadarChartData(dataSets: [dataSet])
        self.RadarChart.data = data
        self.RadarChart.chartDescription?.text = "salam RadarChart 2"
        self.RadarChart.notifyDataSetChanged()
    }
    

    @IBAction func btnSum(_ sender: UIButton)
    {
        /// baraye namayesh nadadan X-value
        self.pieChart.drawEntryLabelsEnabled = true
        
        let data = self.pieChart.data as! PieChartData
        let sum = data.yValueSum
        self.lblResult.text = "\(sum)"
        let dataSets = data.dataSets
        let dataSet = dataSets[0] as! PieChartDataSet /// dataSet class = IChartDataSet
        /// baraye namayesh nadadan Y-value
        dataSet.drawValuesEnabled = true
//        dataSet.removeEntry(index: 2)
//        dataSet.rem
        
        ///
//        dataSet.removeLast()
        /// har kar mikinam be in shive remove nemikone.
        dataSet.removeEntry(ChartDataEntry(x: 0.0, y: Double(number1.value)))
        /// hatman bayad badesh notifyDataSetChanged farakhani beshe. baraye dayere faghat index 0 mishe dad.
//        data.addEntry(PieChartDataEntry(value: Double(100), label: "#0"), dataSetIndex: 0)
        /// baraye dayere false mishe. chon dayare faghat 1 done dataset migire.
        data.removeDataSetByIndex(0)
//        UIView.animate(withDuration: 0.3, animations:
//            {
//                self.pieChart.notifyDataSetChanged()
//            })
        
        self.pieChart.notifyDataSetChanged()
    }
    
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight)
    {
//        print(chartView)
//        print(entry)
//        print(highlight)
    }
    
    @IBAction func btnSelectSlice(_ sender: UIButton)
    {
        self.pieChart.highlightPerTapEnabled = true
        let highLight1 = Highlight(x: 2.0, y: 0, dataSetIndex: 0)
        let highLight2 = Highlight(x: 1.0, y: 0, dataSetIndex: 0)
        let highLight3 = Highlight(x: 0.0, y: 0, dataSetIndex: 0)

        self.pieChart.highlightValue(highLight1)
//        self.pieChart.highlightValue(highLight2)
//        self.pieChart.highlightValues([highLight1, highLight2])
        /// agar bad az highlight chantayi, yeki dige ro highlight koni, ghabli haro ro mipokone.
//        self.pieChart.highlightValue(highLight3)

//        self.pieChart.highlightValue(x: 2.0, dataSetIndex: 0)
    }
    
    
    @IBAction func btnDeselectSlice(_ sender: UIButton)
    {
        let deHighLight1 = Highlight(x: -1.0, y: 0, dataSetIndex: 0)
        self.pieChart.highlightValue(deHighLight1)
    }
    
    
    @IBAction func btnRemoveSlice(_ sender: UIButton)
    {
        let data = self.pieChart.data
        let dataSets = data?.dataSets
        let dataSet = dataSets![0]
        let deleteIndex = 1
        dataSet.removeEntry(index: deleteIndex)
        
        /// in 2 ta kar nemikone.
//        data?.notifyDataChanged()
//        dataSet.notifyDataSetChanged()
        self.pieChart.notifyDataSetChanged()
        
        /// in chie
//        self.pieChart.reloadInputViews()
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

