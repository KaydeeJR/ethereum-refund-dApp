// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

//THE SMART CONTRACT
contract Refund {
    // STATE VARIABLES
    address public creator; // account address from Metamask

    int256 public prevLat; // set latitude

    int256 public prevLong; // set longitude

    uint256 public timestamp; // timestamp at which location has been received

    int256 public longitudeGPS; // Longitude from GPS sensor

    int256 public latitudeGPS; // Latitude from GPS sensor

    uint256 public deviceAccount; // used to identify device

    bool public ComplianceStatus; // smart contract validity

    string public ComplianceDetail; // smart contract validity message

    // array of employee device addresses - stored on blockchain
    address[] public employeeDevices;

    int256 public GPSRange; // location range

    int256 public TimeLimit; // check location after every

    struct EmployeeDevice {
        // track employee device details
        int256 lonGPS; // GPS longitude
        int256 latGPS; // GPS latitude
        int256 lonPrev; // set longitude
        int256 latPrev; // set latitude
        uint256 timePrev; // previous timestamp
        uint256 timeCurr; // current timestamp
        uint256 deviceID; // device account
    }

    // using address as “key” to access EmployeeDevice Struct
    mapping(address => EmployeeDevice) public employeeInfo;

    constructor(int256 timeLimit, int256 gpsRange) {
        // set up owner of the contract as owner of account
        creator = msg.sender;
        ComplianceStatus = true;
        TimeLimit = timeLimit; // how often should employee location be checked
        GPSRange = gpsRange; // how far should the employee be from previous location
    }

    function kill(address ownerAddress) public {
        // destroy contract when needed e.g. when contract has been hacked
        // only account owner (contract owner) can kill it
        // any Ether remaining in the contract will be sent to owner's account

        require(
            ownerAddress == msg.sender,
            "Only contract owner can call this"
        );
        selfdestruct(payable(ownerAddress));
    }

    function getEmployeeDeviceID(address empAddress)
        public
        view
        returns (int devID)
    {
        // using Ethereum address to fetch employee ID - the mapping
        EmployeeDevice storage empDevice = employeeInfo[empAddress];
        return (empDevice.deviceID);
    }

    function addAddress(address empAddress) public {
        //add account address to the array
        employeeDevices.push(empAddress);
    }

    function readCoordinates(address empAddress)
        public
        view
        returns (int256[] memory)
    {
        // fetching employee coordinates from blockchain
        // NO gas required to run because it’s reading a value

        // memory array not stored on blockchain
        EmployeeDevice calldata employee = employeeInfo[empAddress];
        int256[4] locations;
        locations.push(employee.latGPS);
        locations.push(employee.lonGPS);
        locations.push(employee.latPrev);
        locations.push(employee.lonPrev);
        return locations;
    }

    function sendCoordinates(
        int256 latP,
        int256 longP,
        int256 latG,
        int256 longG,
        int256 devID,
        int256 timeStamp
    ) public {
        // sending coordinates function
        // current time at which location is gotten
        employeeDevices.push(
            EmployeeDevice(longG, latG, longP, latP, timeStamp, devID)
        );
    }

    function calculateTimeDiff(uint timePrev, uint timeCurr) public {
        //
    }
    function determineCompliance() public {
        // check if contract is in compliance
        
    }

    function getContractStatus() public view {
        // check contract compliance
        if (ComplianceStatus) {
            // smart contract is in compliance
            ComplianceDetail = "The smart contract is in compliance";
            return ComplianceDetail;
        } else {
            ComplianceDetail = "The smart contract is in out of compliance";
            return ComplianceDetail;  
        }
    }

    // increases the treasury of this contract
    // executed when ether is sent to the contract
    // save the ether sent to the contract instead of rejecting it
    receive() external payable {}
}
