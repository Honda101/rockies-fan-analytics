import pandas as pd
import random
import os
from datetime import datetime, timedelta

# This tells Python to save files in the same folder as this script
current_dir = os.path.dirname(os.path.abspath(__file__))

# Configuration
num_fans = 1200
num_transactions = 5000

# 1. GENERATE FANS
fans = [f"FAN_{i:04d}" for i in range(1, num_fans + 1)]
ticket_data = []

# 2. GENERATE TICKETS
for _ in range(num_transactions):
    fan = random.choice(fans)
    price = random.choice([25, 45, 65, 85, 120, 150])
    # Mix of old dates (for churn) and new dates (for active)
    days_ago = random.choices([random.randint(0, 180), random.randint(400, 700)], weights=[75, 25])[0]
    date = datetime.now() - timedelta(days=days_ago)
    ticket_data.append([fan, price, date.strftime('%Y-%m-%d')])

ticket_path = os.path.join(current_dir, 'rockies_ticket_sales.csv')
pd.DataFrame(ticket_data, columns=['fan_id', 'price_paid', 'game_date']).to_csv(ticket_path, index=False)

# 3. GENERATE CONCESSIONS
concessions = []
for _ in range(num_transactions * 2):
    fan = random.choice(fans)
    item = random.choice(['Beer', 'Hot Dog', 'Soda', 'Nachos', 'Pretzel'])
    amount = random.uniform(8.00, 22.00)
    concessions.append([fan, item, round(amount, 2)])

concessions_path = os.path.join(current_dir, 'stadium_concessions.csv')
pd.DataFrame(concessions, columns=['fan_id', 'item_type', 'amount']).to_csv(concessions_path, index=False)

# 4. GENERATE MERCH
merch = []
for _ in range(int(num_transactions * 0.3)): 
    fan = random.choice(fans)
    item = random.choice(['Rockies Jersey', 'Team Cap', 'Program', 'Memorabilia'])
    amount = random.choice([35, 45, 120, 250])
    merch.append([fan, item, amount])

merch_path = os.path.join(current_dir, 'stadium_merchandise.csv')
pd.DataFrame(merch, columns=['fan_id', 'item_name', 'amount']).to_csv(merch_path, index=False)

print(f"✅ Success! Files saved to: {current_dir}")