//
//  Logging.swift
//  ITSE-1370-Monopoly
//
//  Created by Mason Phillips on 6/21/21.
//

import Foundation
import SwiftyBeaver

struct Printer {
    private let printer = SwiftyBeaver.self
    
    init() {
        let console = ConsoleDestination()
        console.format = "$L: $M"
        printer.addDestination(console)
    }
    
    func print(_ message: Any) {
        self.info(message)
    }
    
    func verbose(_ message: Any, context: Any? = nil) {
        printer.verbose(message, context: context)
    }
    func debug(_ message: Any, context: Any? = nil) {
        printer.debug(message, context: context)
    }
    func info(_ message: Any, context: Any? = nil) {
        printer.info(message, context: context)
    }
    func warning(_ message: Any, context: Any? = nil) {
        printer.warning(message, context: context)
    }
    func error(_ message: Any, context: Any? = nil) {
        printer.error(message, context: context)
    }
}
