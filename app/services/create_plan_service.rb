class CreatePlanService
  def call
    p1 = Plan.where(name: 'Basic').first_or_initialize do |p|
      p.amount = 19.99
      p.interval = 'month'
      p.stripe_id = 'basic'
    end
    p1.save!(:validate => false)
    p2 = Plan.where(name: 'Classic').first_or_initialize do |p|
      p.amount = 99.99
      p.interval = 'month'
      p.stripe_id = 'classic'
    end
    p2.save!(:validate => false)
    p3 = Plan.where(name: 'Modern').first_or_initialize do |p|
      p.amount = 199.99
      p.interval = 'month'
      p.stripe_id = 'modern'
    end
    p3.save!(:validate => false)
  end
end
