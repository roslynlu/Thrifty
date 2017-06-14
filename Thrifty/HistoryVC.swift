//
//  HistoryVC.swift
//  Thrifty
//
//  Created by Roslyn Lu on 6/14/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit
import JTCalendar

class HistoryVC: UIViewController, JTCalendarDelegate {

    @IBOutlet var calendarMenuView: JTCalendarMenuView!
    @IBOutlet var weekDayView: JTCalendarWeekDayView!
    @IBOutlet var calendarContentView: JTHorizontalCalendarView!
    var calendarManager: JTCalendarManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calendarManager = JTCalendarManager()
        self.calendarManager.delegate = self
        calendarManager.menuView = calendarMenuView
        calendarManager.contentView = calendarContentView
//        calendarManager.setDate(calendarManager.date())
        calendarManager.date()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
