from python.dev.event import Event

class Rebase(Event):
    
    def __init__(self, apy, t_delta, address = None):
        self.__t_delta = t_delta
        self.__delta = 0
        self.__apy = apy
        self.__address = address if address != None else address
        
    def get_time_delta(self):
        return self.__t_delta
       
    def get_delta(self):
        return self.__delta
    
    def get_apy(self):
        return self.__apy

    def get_address(self):
        return self.__address
    
    def type_of(self):
        return Event.EVENT_REBASE