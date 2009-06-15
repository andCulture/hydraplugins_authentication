package com.hydraframework.plugins.authentication
{
	import com.hydraframework.core.mvc.patterns.plugin.Plugin;
	import com.hydraframework.plugins.authentication.controller.*;
	import com.hydraframework.plugins.authentication.model.IdentityProxy;
	
	public class AuthenticationManager extends Plugin
	{
		public static const NAME:String = "AuthenticationManager";
		public static const LOGIN:String = "plugins.authentication.login";
		public static const LOGOUT:String = "plugins.authentication.logout";
		public static const LOGINID_SET:String = "plugins.authentication.loginidSet";
		public static const ROLE_RETRIEVE:String = "plugins.authentication.roleRetrieve";
		public static const RESTRICTION_RETRIEVE:String = "plugins.authentication.restrictionRetrieve";
		public static const INFORMATION_RETRIEVE:String = "plugins.authentication.informationRetrieve";
		public static const ROLE_CHECK:String = "plugins.authentication.roleCheck";
		
		/**
		 * @private
		 * Cached instance of the AuthenticationManager.
		 */
		private static const _instance:AuthenticationManager = new AuthenticationManager();

		/**
		 * Returns a cached instance of the AuthenticationManager.
		 */
		public static function getInstance():AuthenticationManager {
			return _instance;
		}

		public function AuthenticationManager()
		{
			super(NAME);
		}

		override public function preinitialize():void {
			super.preinitialize();
			/*
			   Proxies
			 */
			this.facade.registerProxy(IdentityProxy.getInstance());
			/*
			   Commands
			 */
			this.facade.registerCommand(AuthenticationManager.LOGIN, LoginCommand);
			this.facade.registerCommand(AuthenticationManager.LOGOUT, LogoutCommand);
			this.facade.registerCommand(AuthenticationManager.ROLE_CHECK, RoleCheckCommand);
			this.facade.registerCommand(AuthenticationManager.ROLE_RETRIEVE, RoleRetrieveCommand);
			this.facade.registerCommand(AuthenticationManager.RESTRICTION_RETRIEVE, RestrictionRetrieveCommand);
			this.facade.registerCommand(AuthenticationManager.INFORMATION_RETRIEVE, InformationRetrieveCommand);
		}
		
		public function isLoggedOn():Boolean
		{
			return IdentityProxy.getInstance().isLoggedOn();
		}
	}
}