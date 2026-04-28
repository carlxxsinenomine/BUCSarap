from sqlalchemy import text
from session import engine

def view_all_stalls():
    try:
        with engine.connect() as conn:
            result = conn.execute(
                text("""
                    SELECT stall_id, stall_name, opening_time, closing_time, operating_days, stall_status, photo_path
                    FROM stall
                    ORDER BY stall_id
                """)
            )
            stalls = result.fetchall()

            if not stalls:
                print("\nStalls not found")
                return

            print("\n" + "=" * 100)
            print(f"{'ID':<5} {'Name':<20} {'Status':<12} {'Hours':<20} {'Days':<15} {'Photo Path'}")
            print("-" * 100)

            for stall in stalls:
                stall_id, name, open_time, close_time, days, status, photo = stall
                status_str = "Open" if status else "Closed"
                hours = (f"{open_time} - {close_time}")
                print(f"{stall_id:<5} {name:<20} {status_str:<12} {hours:<20} {days:<15} {photo}")

            print("=" * 100)

    except Exception:
        print("\nError retrieving stalls")

def show_stall_details(stall_id):
    try:
        with engine.connect() as conn:
            result = conn.execute(
                text("""
                    SELECT stall_name, opening_time, closing_time,
                           operating_days, stall_status, photo_path
                    FROM stall
                    WHERE stall_id = :sid
                """),
                {"sid": stall_id}
            )
            stall = result.fetchone()

            if not stall:
                print(f"\nNo stall found with ID {stall_id}.")
                return

            name, open_time, close_time, days, status, photo = stall
            status_str = "Open" if status else "Closed"

            print("\n" + "=" * 60)
            print(f"STALL DETAILS: {name}")
            print("-" * 60)
            print(f"{'Status':<14}: {status_str}")
            print(f"{'Hours':<14}: {open_time} - {close_time}")
            print(f"{'Operating Days':<14}: {days}")
            print(f"{'Photo Path':<14}: {photo}")
            print("=" * 60)

            show_products_for_stall(stall_id)

    except Exception:
        print(f"\nError retrieving stall details")

def show_products_for_stall(stall_id):
    try:
        with engine.connect() as conn:
            result = conn.execute(
                text("""
                    SELECT p.product_name, p.product_price, p.product_status, pc.category_name
                    FROM product p
                    JOIN product_category pc ON p.category_id = pc.category_id
                    WHERE pc.stall_id = :sid
                    ORDER BY pc.category_name, p.product_name
                """),
                {"sid": stall_id}
            )
            products = result.fetchall()

            if not products:
                print("\nNo products\n")
                return
            
            print("\nProducts:")
            for prod in products:
                name, price, status, category = prod
                avail = "Available" if status else "Unavailable"
                print(f"{category} - {name} ({price:.2f}) - {avail}")
            
            print("\n")
    except Exception:
        print(f"\nError loading products")

def customer_menu():
    while True:
        print("Customer Menu:")
        print("1. View all stalls")
        print("2. View stall details (by ID)")
        print("3. Exit")

        choice = input("Enter your choice (1-3): ").strip()

        if choice == "1":
            view_all_stalls()
        elif choice == "2":
            try:
                sid = int(input("Enter stall ID: ").strip())
                show_stall_details(sid)
            except ValueError:
                print("Invalid ID")
        elif choice == "3":
            print("Babye")
            break
        else:
            print("Invalid choice. Please enter 1, 2, or 3")

if __name__ == "__main__":
    customer_menu()