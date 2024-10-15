import os from 'os';

// import dns from 'dns';
export function getLocalIPs() {
  const interfaces = os.networkInterfaces();
  const ips = Object.keys(interfaces).reduce(
    (arr, iface) =>
      arr.concat(
        interfaces[iface]
          .filter((info) => info.family === 'IPv4' && !info.internal)
          .map((info) => info.address),
      ),
    [],
  );
  return ips;
}

// export function getPublicIP(callback) {
//   dns.lookup(os.hostname(), (err, ip, type: string) => {
//     if (err) {
//       console.error(err);
//       callback(null);
//     } else {
//       callback(ip);
//     }
//   });
// }
