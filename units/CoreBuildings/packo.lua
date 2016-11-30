return {
	packo = {
		acceleration = 0,
		airsightdistance = 850,
		brakerate = 0,
		buildangle = 8192,
		buildcostenergy = 5800,
		buildcostmetal = 380,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 5,
		buildinggrounddecalsizey = 5,
		buildinggrounddecaltype = "packo_aoplane.dds",
		buildpic = "PACKO.DDS",
		buildtime = 5810,
		category = "ALL NOTLAND WEAPON NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE",
		cloakcost = 12,
		corpse = "DEAD",
		damagemodifier = 0.2,
		description = "Pop-Up Missile Battery",
		explodeas = "mediumBuildingexplosiongeneric",
		footprintx = 3,
		footprintz = 3,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 1200,
		maxslope = 10,
		maxwaterdepth = 0,
		mincloakdistance = 72,
		name = "Pack0",
		nochasecategory = "ALL",
		objectname = "PACKO",
		seismicsignature = 0,
		selfdestructas = "mediumBuildingexplosiongeneric",
		sightdistance = 375,
		usebuildinggrounddecal = true,
		yardmap = "ooooooooo",
		customparams = {
			death_sounds = "generic",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "-0.544990539551 0.0 -0.500007629395",
				collisionvolumescales = "48.1152496338 19.0 48.1152496338",
				collisionvolumetype = "Box",
				damage = 720,
				description = "Pack0 Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 20,
				hitdensity = 100,
				metal = 275,
				object = "PACKO_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 360,
				description = "Pack0 Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 110,
				object = "3X3B",
                collisionvolumescales = "55.0 4.0 6.0",
                collisionvolumetype = "cylY",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = { 
 			pieceExplosionGenerators = { 
				"deathceg3",
				"deathceg4",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			cloak = "kloak2",
			uncloak = "kloak2un",
			underattack = "warning1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "servmed1",
			},
			select = {
				[1] = "servmed1",
			},
		},
		weapondefs = {
			packo_missile = {
				areaofeffect = 16,
				avoidfeature = false,
				canattackground = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				energypershot = 0,
				cegTag = "missiletrailflashy",
				explosiongenerator = "custom:genericshellexplosion-small-aa",
				firestarter = 72,
				flighttime = 2.2,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				metalpershot = 0,
				model = "missile",
				name = "AA2Missile",
				noselfdamage = true,
				range = 1110,
				reloadtime = 0.425,
				smoketrail = false,
				soundhit = "packohit",
				soundhitwet = "splshbig",
				soundhitwetvolume = 0.5,
				soundstart = "packolau",
				soundtrigger = true,
				startvelocity = 350,
				texture2 = "armsmoketrail",
				tolerance = 9950,
				tracks = true,
				turnrate = 68000,
				turret = true,
				weaponacceleration = 250,
				weapontimer = 2,
				weapontype = "MissileLauncher",
				weaponvelocity = 1250,
				damage = {
					default = 115,
					subs = 5,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "NOTAIR",
				def = "PACKO_MISSILE",
				onlytargetcategory = "VTOL",
			},
		},
	},
}
