from python.dev.lp.event import LPEvent
from python.dev.event import Mint
from python.dev.action import SwapAction
import copy

class SwapLPEvent(LPEvent):

     
    def __init__(self, swap_action):
        self.__swap_action = swap_action
        self.__liquidity = None

    def update(self, liquidity):
        x_name = liquidity.get_x_name()
        y_name = liquidity.get_y_name()
        
        target1 = self.__swap_action.get_target(SwapAction.ACTION_TYPE_WITHDRAW)
        target1.update_token_index()
        target2 = self.__swap_action.get_target(SwapAction.ACTION_TYPE_DEPOSIT)
        target2.update_token_index()        
        
        token_type = target2.get_token_type()
        token_name = target2.get_name()
        
        if(token_type == Mint.TYPE_REBASE):
            token_address = self.__retrieve_address()
            token_yield = self.__retrieve_token_yield(token_address)
            if(token_name == x_name): liquidity.delta_x(token_yield)
            if(token_name == y_name): liquidity.delta_y(token_yield)

            
        token_delta = self.__retrieve_token_delta()    
        L = liquidity.swap(token_delta)
        self.set_liquidity(liquidity)
        
        return L  
    
    
    def __retrieve_address(self):
        mint_id = self.__swap_action.get_mint_id()
        return self.__swap_action.get_target().get_address(mint_id)
    
    def __retrieve_token_yield(self, address):
        token = self.__swap_action.get_target().get_token()
        return token.get_state_series(address).get_last_state().get_yield()    
    def __retrieve_token_delta(self):
        return self.__swap_action.get_event().get_delta()  
    
    def set_liquidity(self, liquidity):
        self.__liquidity = copy.copy(liquidity)
        
    def get_liquidity(self):
        return self.__liquidity        
    
    def get_action(self):
        return self.__swap_action       

    def get_type(self):
        return LPEvent.EVENT_LP_SWAP     
   
    