Fluttershy secrets -- not committed.

## How to recreate after a fresh clone or wipe
1. Copy the original backed-up host keys from the backup location:
   ```
   cd secrets/
   sudo cp /mnt/big/backups/fluttershy/2025-12-15/etc/ssh/ssh_host_* .
   sudo chown -v chrisj:chrisj ssh_host_*
   ```
2. Set correct permissions:
   ```
   chmod 600 ssh_host_*_key
   chmod 644 ssh_host_*_key.pub
   ```
3. Run the common role to restore them on fluttershy:
   ```
   ansible-playbook -i inventory.ini playbook.yml --tags common
   ```

These files are used by the common role to restore fluttershy's original SSH host identity after a reflash.
