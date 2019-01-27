const CIDTracker = artifacts.require('../contracts/CIDTracker.sol');

contract('CIDTracker', (accounts) => {
  var admin = accounts[0];
  var uploader = accounts[1];

  var cidTracker;
  var validIpfsCID = "QmPXgPCzbdviCVJTJxvYCWtMuRWCKRfNRVcSpARHDKFSha"

  beforeEach(async () => {
    cidTracker = await CIDTracker.new()
  })

  it("Stores an ipfs cid for the owner address", async () => {
    const response = await cidTracker.addCID(validIpfsCID, { from: uploader })
    console.log(response.logs[0].args)
    console.log('admin: ' + admin);
    console.log('uploader: ' + uploader);
    assert.equal(response.logs[0].args.ipfsCID, validIpfsCID, 'not correctly uploaded')
  });
});
