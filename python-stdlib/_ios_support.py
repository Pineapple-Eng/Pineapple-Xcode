from ctypes import cdll, c_void_p, c_char_p
from ctypes import util


def get_platform_ios():
    objc = cdll.LoadLibrary(util.find_library(b'objc'))

    objc.objc_getClass.restype = c_void_p
    objc.objc_getClass.argtypes = [c_char_p]
    objc.objc_msgSend.restype = c_void_p
    objc.objc_msgSend.argtypes = [c_void_p, c_void_p]
    objc.sel_registerName.restype = c_void_p
    objc.sel_registerName.argtypes = [c_char_p]

    UIDevice = c_void_p(objc.objc_getClass(b'UIDevice'))
    SEL_currentDevice = c_void_p(objc.sel_registerName(b'currentDevice'))
    device = c_void_p(objc.objc_msgSend(UIDevice, SEL_currentDevice))

    SEL_systemVersion = c_void_p(objc.sel_registerName(b'systemVersion'))
    systemVersion = c_void_p(objc.objc_msgSend(device, SEL_systemVersion))

    SEL_systemName = c_void_p(objc.sel_registerName(b'systemName'))
    systemName = c_void_p(objc.objc_msgSend(device, SEL_systemName))

    SEL_model = c_void_p(objc.sel_registerName(b'model'))
    systemModel = c_void_p(objc.objc_msgSend(device, SEL_model))

    # UTF8String returns a const char*;
    SEL_UTF8String = c_void_p(objc.sel_registerName(b'UTF8String'))
    objc.objc_msgSend.restype = c_char_p

    system = objc.objc_msgSend(systemName, SEL_UTF8String).decode()
    release = objc.objc_msgSend(systemVersion, SEL_UTF8String).decode()
    model = objc.objc_msgSend(systemModel, SEL_UTF8String).decode()

    return system, release, model
