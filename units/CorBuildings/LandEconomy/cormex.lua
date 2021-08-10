local unitName = Spring.I18N('units.names.cormex')

return {
	cormex = {
		acceleration = 0,
		activatewhenbuilt = true,
		brakerate = 0,
		buildangle = 2048,
		buildcostenergy = 500,
		buildcostmetal = 50,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 5,
		buildinggrounddecalsizey = 5,
		buildinggrounddecaltype = "decals/cormex_aoplane.dds",
		buildingmask = 0,
		buildpic = "CORMEX.PNG",
		buildtime = 1874,
		canrepeat = false,
		category = "ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE EMPABLE CANBEUW UNDERWATER",
		collisionvolumeoffsets = "0 3 0",
		collisionvolumescales = "48 33 48",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		description = Spring.I18N('units.descriptions.cormex'),
		energyuse = 3,
		explodeas = "smallBuildingexplosiongeneric",
		extractsmetal = 0.001,
		footprintx = 4,
		footprintz = 4,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 175,
		maxslope = 30,
		--maxwaterdepth = 20,
		metalstorage = 50,
		name = unitName,
		objectname = "Units/CORMEX.s3o",
		onoffable = true,
		script = "Units/CORMEX.cob",
		seismicsignature = 0,
		selfdestructas = "smallMex",
		selfdestructcountdown = 1,
		sightdistance = 273,
		usebuildinggrounddecal = true,
		yardmap = "oooo oooo oooo oooo",
		customparams = {
			cvbuildable = true,
			metal_extractor = 1,
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			removestop = true,
			removewait = true,
			subfolder = "corbuildings/landeconomy",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "-3.07257080078 -0.112374182129 0.00819396972656",
				collisionvolumescales = "61.0307312012 23.0310516357 47.5323181152",
				collisionvolumetype = "Box",
				damage = 105,
				description = Spring.I18N('units.dead', { name = unitName }),
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 20,
				hitdensity = 100,
				metal = 33,
				object = "Units/cormex_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "55.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 53,
				description = Spring.I18N('units.heap', { name = unitName }),
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 13,
				object = "Units/cor3X3E.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
				[3] = "deathceg4",
			},
		},
		sounds = {
			activate = "mexon",
			canceldestruct = "cancel2",
			deactivate = "mexoff",
			underattack = "warning1",
			working = "mexworking",
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
			-- ok = {
			-- 	[1] = "mexworking",
			-- },
			select = {
				[1] = "mexselect",
			},
		},
	},
}
