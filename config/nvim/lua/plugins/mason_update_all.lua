return {
	"RubixDev/mason-update-all",

	dependencies = { "williamboman/mason.nvim" },

	config = function()
		require("mason-update-all").setup()
	end,

}
