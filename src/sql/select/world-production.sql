SELECT 
  economy.economy_label, 
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
