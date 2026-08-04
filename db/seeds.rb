Bait.destroy_all
User.destroy_all
Like.destroy_all

Bait.create!(
  name: 'Fat Rap',
  category: 'Crankbait',
  image: 'fat-rap.png',
  description: "It happens to the best of us: you've got what looks like perfect fishing conditions and yet the fish seem finicky. Reach for a Fat Rap and crank in the fish! 🐟"
)

Bait.create!(
  name: 'Yummy Gummy',
  category: 'Softbait',
  image: 'yummy-gummy.png',
  description: "This bait might not look soft and yummy to you, but that's only because you're not a fish! 😜"
)

Bait.create!(
  name: 'Fire Tiger',
  category: 'Spinner',
  image: 'fire-tiger.png',
  description: "Muddy water or clear water, it makes no difference with this spinner. The Fire Tiger is versatile, consistent, and oh so tempting. 💙"
)

Bait.create!(
  name: 'Mr. Mustache',
  category: 'Popper',
  image: 'mr-mustache.png',
  description: "Splish, splash, this popper has your back! C'mon fish, check out Mr. Mustache."
)

Bait.create!(
  name: 'Strike King',
  category: 'Crankbait',
  image: 'strike-king.png',
  description: "With the perfect wobble, just the right amount of buoyancy, and spot-on coloring, this bait is the King. 🐡"
)

Bait.create!(
  name: 'Rooster Tail',
  category: 'Spinner',
  image: 'rooster-tail.png',
  description: "There's a good reason this colorful, spinning bait has been around since the 1950s: it flat out produces"
)

Bait.create!(
  name: 'Marabou Muddler',
  category: 'Fly',
  image: 'marabou-muddler.png',
  description: "There's no sense muddling around with other baits in fast, deep water. Tie on a Marabou Muddler to get where the fish are, fast!"
)

Bait.create!(
  name: 'Bucktail',
  category: 'Spinner',
  image: 'bucktail.png',
  description: "Time-tested and angler-approved... by the US Navy! During World War II, emergency kits for sailors and pilots included a bucktail along with fishing line. Rumor has it, this bait is still used as survival equipment by Navy Seals today. 🌠"
)

Bait.create!(
  name: 'Daredevil',
  category: 'Spoon',
  image: 'daredevil.png',
  description: "Take your pick: use your great-granddaddy's, your granddaddy's, your daddy's, or your own spoon. This wiggly, wobbly bait has been a staple in tackle boxes for generations."
)

Bait.create!(
  name: 'Lemon Drop',
  category: 'Softbait',
  image: 'lemon-drop.png',
  description: "This one's an eye catcher for sure! 😲 It's perfect for getting the fleeting attention of fish in your favorite dark hole. "
)

Bait.create!(
  name: 'Krocodile',
  category: 'Spoon',
  image: 'krocodile.png',
  description: "🐊 The versatility of this spoon makes it a favorite. Whether you cast and retrieve with it, use it as a jig, or simply troll with it, you'll use it season after season. "
)

Bait.create!(
  name: 'Purple Reign',
  category: 'Spinner',
  image: 'purple-reign.png',
  description: "This purple beauty will help you reign in the big fish of the deep. Fish with it by itself or rig it with a rubber worm, live shrimp, or other natural baits."
)

baits = Bait.all

names = %w(
Macie
Grace 
Walter
Erin
Sam
Brynn
Keith
Wade
Leroy
Lucy
)
names.each do |name|
  user =
    User.create!(
      username: name,
      password: 'SELECT "baits".* FROM "baits"'
    )

  baits.sample(rand(2..5)).each do |bait|
    TackleBoxItem.create!(
      user: user,
      bait: bait
    )

    rand(1..20).times do
      FishCatch.create!(
        user: user,
        bait: bait,
        species: FishCatch::SPECIES.sample,
        weight: rand(1..10),
        length: rand(10..30),
        created_at: rand(2..20).days.ago
      )
    end
  end
end

users = User.all

FishCatch.all.each do |fish_catch|
  users.sample(rand(0..10)).each do |user|
    unless user == fish_catch.user
      Like.create!(user: user, fish_catch: fish_catch)
    end
  end
end
