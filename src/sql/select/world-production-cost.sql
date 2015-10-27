SELECT 
  economy.economy_label AS economy, 
  product.product_label AS product, 
  world.world_label AS world,
  world_production_cost.world_product_quantity AS quantity,
  world_production.product_id,
  world_production.world_production_id,
  world.world_id,
  product.product_id
FROM public.economy
left join public.product on (economy.economy_id = product.economy_id)
left join public.world on (world.economy_id = economy.economy_id)
left join public.world_production on (world_production.world_id = world.world_id AND world_production.product_id = product.product_id)
left join public.world_production_cost on (world_production_cost.world_production_id = world_production.world_production_id AND world.world_id = world_production_cost.world_id AND product.product_id = world_production_cost.product_id)
