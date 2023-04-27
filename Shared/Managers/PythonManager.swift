// Created by Dhamova on 2023-04-27.

import Foundation
import Python
import PythonKit

func initPython() {
    guard let stdLibPath = Bundle.main.path(forResource: "python-stdlib", ofType: nil) else { return }
    guard let libDynloadPath = Bundle.main.path(forResource: "python-stdlib/lib-dynload", ofType: nil) else { return }
    setenv("PYTHONHOME", stdLibPath, 1)
    setenv("PYTHONPATH", "\(stdLibPath):\(libDynloadPath)", 1)
    Py_Initialize()
}

func helloPython() {
    let sys = Python.import("sys")
    print("Python Version: \(sys.version_info.major).\(sys.version_info.minor)")
    sys.path.append(Bundle.main.resourcePath)

    let helloWorld = try? Python.attemptImport("HelloWorld")
    helloWorld?.hello()
}
