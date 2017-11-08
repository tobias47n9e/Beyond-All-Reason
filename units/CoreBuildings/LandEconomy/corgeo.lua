return {
	corgeo = {
		acceleration = 0,
		activatewhenbuilt = true,
		brakerate = 0,
		buildangle = 4096,
		buildcostenergy = 13000,
		buildcostmetal = 550,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 6,
		buildinggrounddecalsizey = 6,
		buildinggrounddecaltype = "corgeo_aoplane.dds",
		buildpic = "CORGEO.DDS",
		buildtime = 12875,
		canrepeat = false,
		category = "ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "2 -6 0",
		collisionvolumescales = "63 45 59",
		collisionvolumetype = "Box",
		corpse = "dead",
		description = "Produces Energy / Storage",
		energymake = 300,
		energystorage = 1000,
		explodeas = "geo",
		footprintx = 4,
		footprintz = 4,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 1850,
		maxslope = 15,
		maxwaterdepth = 99999,
		name = "Geothermal Powerplant",
		objectname = "CORGEO",
		seismicsignature = 0,
		selfdestructas = "geo",
		sightdistance = 273,
		usebuildinggrounddecal = true,
		yardmap = "oooo oGGo oGGo oooo",
		customparams = {
			cvBuildable = true,
			removewait = true,
			removestop = true,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.0799026489258 -0.00265155029297 -0.0",
				collisionvolumescales = "71.8282928467 49.0236968994 58.0464782715",
				collisionvolumetype = "Box",
				damage = 1110,
				description = "Geothermal Powerplant Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 4,
				footprintz = 4,
				height = 20,
				hitdensity = 100,
				metal = 328,
				object = "CORGEO_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 555,
				description = "Geothermal Powerplant Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 4,
				footprintz = 4,
				height = 4,
				hitdensity = 100,
				metal = 131,
				object = "4X4B",
                collisionvolumescales = "85.0 14.0 6.0",
                collisionvolumetype = "cylY",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = { 
 			pieceExplosionGenerators = { 
				"deathceg2",
				"deathceg3",
				"deathceg4",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "geothrm2",
			},
		},
	},
}
