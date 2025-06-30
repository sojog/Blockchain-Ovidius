

// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;



interface ERC721 /* is ERC165 */ {

    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);

    /// @return The number of NFTs owned by `_owner`, possibly zero
    function balanceOf(address _owner) external view returns (uint256);

    function ownerOf(uint256 _tokenId) external view returns (address);
}

interface ERC721Metadata /* is ERC721 */ {

    function name() external view returns (string memory _name);

    function symbol() external view returns (string  memory _symbol);

    function tokenURI(uint256 _tokenId) external view returns (string memory);
}





contract OvidiusNFT is ERC721, ERC721Metadata {

    
    string public name = "OvidiusNFT";
    string public symbol = "OVDNFT";
    string private baseURI = "https://univ-ovidius.com/api/v1/token;";

    uint256 private tokenIdCounter = 0;

    // address <-> uint256
    mapping (address => uint256) private balances;
    mapping (uint256 => address ) private  owners;  // tokenIdToAddress;


    // uint256 <-> address

    function balanceOf(address _owner) external view returns (uint256) {
        require(_owner != address(0), "Adresa nu poate fi 0"); 
        return balances[_owner];

    }

    // Varianta mai costisitoare
    // function ownerOf(uint256 _tokenId) external view returns (address){
    //     address searched_owner = owners[_tokenId];
    //     require(searched_owner != address(0), "Token-ul nu exista");
    //     return owners[_tokenId];
    // }

    function ownerOf(uint256 _tokenId) external view returns (address){
        address searched_owner = owners[_tokenId];
        require(searched_owner != address(0), "Token-ul nu exista");
        return searched_owner;
    }

    function mint() public {

        uint256 memoryCounter =  tokenIdCounter;
        memoryCounter += 1;

        balances[msg.sender] += 1;
        owners[memoryCounter] = msg.sender;


        tokenIdCounter = memoryCounter;


    }

    function transferFrom(address _from, address _to, uint256 _tokenId) external payable{
        require(msg.sender == _from, "Nu puteti face transfer de la o alta persoana");
        require(_to != address(0), "Adresa nu poate fi 0");
        require(owners[_tokenId] == msg.sender, "Nu sunteti detinatorul NFT-ului");


        owners[_tokenId]  = _to;
        balances[_from] -= 1;
        balances[_to] += 1;


        emit Transfer(_from, _to, _tokenId);

    }

    function tokenURI(uint256 _tokenId) external view returns (string memory) {

        return  string(abi.encodePacked(baseURI, _tokenId));

    }



}