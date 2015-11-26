#Connect to database

#For each world
#- Create a table of production + import - consumption - export
#- Update each world

import psycopg2

print "Connecting to DB..."

try:
    conn = psycopg2.connect("dbname='trade-nodes' user='postgres' host='localhost' password='postgres'")
except:
    print "I am unable to connect to the database"
    
print "Setting cursor."

cur = conn.cursor()

print "Executing query"

#cur.execute("""SELECT datname from pg_database""")
cur.execute("""

    SELECT 
      economy.economy_label,
      world.world_label,
      product.product_label, 
      world_production.world_product_quantity
    FROM 
      public.economy, 
      public.product, 
      public.world_production, 
      public.world
    WHERE 
      economy.economy_id = product.economy_id AND
      world_production.world_id = world.world_id AND
      world_production.product_id = product.product_id AND
      world.economy_id = economy.economy_id;

""")

print "Fetching..."

rows = cur.fetchall()

"""
print "\nShow me the databases:\n"
"""
print "\nRows:\n"
for row in rows:
    print "   ", row
