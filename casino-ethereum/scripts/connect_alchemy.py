from web3 import Web3
import os
from pathlib import Path
from dotenv import load_dotenv

class AlchemyConnect():
    """
    class that connects to Alchemy Platform
    
    starter code is from the Alchemy Website
    """

    def __init__(self) -> None:
        """
        connects to the Ethereum test net : goerli
        """
        alchemy_url = "https://eth-goerli.g.alchemy.com/v2/Rc-rs7Xsdcyt0i404b5HDMl2qbEzYddo"
        self.w3 = Web3(Web3.HTTPProvider(alchemy_url))
        # path to environment file
        path = str(Path(os.getcwd()))+"/.env"
        # access environment variables
        load_dotenv(path)
    
    def confirm_connection(self):
        """
        checks whether the dApp is connected
        """
        return self.w3.isConnected()

    def get_current_block(self):
        """
        fetch the current block number from the goerli test network
        """
        latest_block = self.w3.eth.block_number
        return latest_block
    
    def get_account_balance(self, account_address):
        """
        Parameters : account address e.g. '0x742d35Cc6634C0532925a3b844Bc454e4438f44e'

        returns the current balance of the account (account must be on the same Ethereum network)
        """
        balance = self.w3.eth.get_balance(account_address)
        return balance
    
    def get_transaction_details(self, trasaction_id):
        """
        Parameters: transaction_id e.g. '0x5c504ed432cb51138bcf09aa5e8a410dd4a1e204ef84bfed1be16dfba1b22060'

        Get the information of a transaction made on the network
        """
        tx = self.w3.eth.get_transaction()
        return(tx)

if __name__=="__main__":
    connect_class = AlchemyConnect()
    SECRET_KEY = os.getenv('SECRET_KEY')
    ADDRESS = os.getenv('ACCOUNT_ADDRESS')
        
    connection = connect_class.confirm_connection()
    if connection:
        block_address = connect_class.get_current_block()
        print(block_address)
        account_bal = connect_class.get_account_balance(ADDRESS)
        print(account_bal)
