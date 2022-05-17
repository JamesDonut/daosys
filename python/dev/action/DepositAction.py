from python.dev.action import Action

class DepositAction(Action):
    
    def __init__(self, token_event, target, user):
        self.__token_event = token_event
        self.__target = target
        self.__user = user
              
    def apply(self, agents):
        return True
        
    def get_user(self):
        return self.__user
    
    def get_target(self):
        return self.__target    
        
    def get_type(self):
        return Action.TYPE_MINT
        