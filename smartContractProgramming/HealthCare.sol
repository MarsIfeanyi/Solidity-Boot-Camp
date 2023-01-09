// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HealthCare {
    // mapping of patients to their health providers
    mapping(bytes32 => address) public patients;

    // mapping of patients to the health providers they have visited
    mapping(bytes32 => address[]) public visitedProviders;

    // mapping of health providers to their patients
    mapping(address => bytes32[]) public providers;

    // add a patient to the mapping
    function addPatient(bytes32 _patientId, address _provider) public {
        patients[_patientId] = _provider;
        providers[_provider].push(_patientId);
    }

    // record a visit by a patient to a health provider
    function visitProvider(bytes32 _patientId, address _provider) public {
        //visitedProviders[_provider].push(_patientId);
    }

    // get the current health provider for a patient
    function getProvider(bytes32 _patientId) public view returns (address) {
        return patients[_patientId];
    }

    // get the list of patients for a health provider
    function getPatients(
        address _provider
    ) public view returns (bytes32[] memory) {
        return providers[_provider];
    }

    // get the list of health providers that a patient has visited
    function getVisitedProviders(
        bytes32 _patientId
    ) public view returns (address[] memory) {
        return visitedProviders[_patientId];
    }
}
