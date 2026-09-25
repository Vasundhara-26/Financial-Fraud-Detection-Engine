import java.util.HashMap;
import java.util.Map;

public class AccountService {

    static class Account {
        int accountId;
        String holderName;
        double balance;
        boolean isLocked;

        Account(int accountId, String holderName, double balance) {
            this.accountId = accountId;
            this.holderName = holderName;
            this.balance = balance;
            this.isLocked = false;
        }
    }

    private Map<Integer, Account> accountDatabase = new HashMap<>();

    public void addAccount(Account acc) {
        accountDatabase.put(acc.accountId, acc);
    }

    public void freezeAccount(int accountId, String reason) {
        Account acc = accountDatabase.get(accountId);

        if (acc != null) {
            acc.isLocked = true;

            System.out.println(
                "[JAVA SERVICE] Account " + accountId +
                " (" + acc.holderName + ") FROZEN. Reason: " + reason
            );
        } else {
            System.out.println(
                "[JAVA SERVICE] Account " + accountId + " not found."
            );
        }
    }

    public static void main(String[] args) {

        AccountService service = new AccountService();

        service.addAccount(
            new Account(5001, "Vasundhara Yadav", 15000.00)
        );

        service.addAccount(
            new Account(5002, "John Doe", 2500.00)
        );

        System.out.println("--- Java Account Management Service ---");

        service.freezeAccount(
            5001,
            "High-risk transaction threshold breached."
        );
    }
}
