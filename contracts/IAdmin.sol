// Sources flattened with hardhat v2.4.0 https://hardhat.org

// File contracts/interfaces/IAdmin.sol

pragma solidity 0.6.6;

interface IAdmin {
    function isSuperAdmin(address _addr) external view returns (bool);

    function isAdmin(address _addr) external view returns (bool);
}