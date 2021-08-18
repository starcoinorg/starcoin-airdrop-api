const fs = require('fs')
const path = require('path')
const rawdata = fs.readFileSync(path.resolve(__dirname, 'reward.json'))
const reward = JSON.parse(rawdata)

reward.proofs.map((proof) => {
  const data = {
    airDropId: Number(reward.airDropId),
    ownerAddress: reward.ownerAddress,
    root: reward.root,
    chainId: reward.chainId,
    address: proof.address.toLowerCase(),
    idx: Number(proof.index),
    amount: Number(proof.amount),
    proof: proof.proof,
  }
  // console.log({data});
  const sql = `insert into airdrop_records (id, address, amount, idx, proof, air_drop_id, owner_address, root, network_version) values (null, '${
    data.address
  }', ${data.amount}, ${data.idx}, '${JSON.stringify(data.proof)}', ${
    data.airDropId
  }, '${data.ownerAddress}', '${data.root}', ${data.chainId});`
  console.log(sql)
})
