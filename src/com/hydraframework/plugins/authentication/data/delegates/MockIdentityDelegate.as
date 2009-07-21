/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.hydraframework.plugins.authentication.data.delegates {
	import com.hydraframework.plugins.authentication.data.descriptors.Identity;
	import com.hydraframework.plugins.authentication.data.interfaces.IIdentityDelegate;
	import com.hydraframework.plugins.authentication.data.interfaces.ILoginInformation;
	
	import flash.utils.setTimeout;
	
	import mx.core.mx_internal;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;

	public class MockIdentityDelegate implements IIdentityDelegate {

		private var _responder:IResponder;

		public function set responder(value:IResponder):void {
			_responder=value;
		}

		public function get responder():IResponder {
			return _responder;
		}

		public function MockIdentityDelegate() {
		}

		public function login(loginInfo:ILoginInformation):void {
			var asyncToken:AsyncToken=new AsyncToken(null);

			var fakeIdentity:Identity=new Identity();
			fakeIdentity.userId="ABC123";
			fakeIdentity.displayName="Fake ID";

			asyncToken.addResponder(new Responder(function(data:Object):void {
				//
				// Transform / normalize response if necessary
				//
					responder.result(data);
				}, function(info:Object):void {
					responder.fault(info);
				}));

			setTimeout(function():void {
					asyncToken.mx_internal::applyResult(new ResultEvent(ResultEvent.RESULT, false, true, fakeIdentity, asyncToken, null));
				}, 200);
		}

		public function logout():void {
			var asyncToken:AsyncToken=new AsyncToken(null);

			asyncToken.addResponder(new Responder(function(data:Object):void {
				//
				// Transform / normalize response if necessary
				//
					responder.result(data);
				}, function(info:Object):void {
					responder.fault(info);
				}));

			setTimeout(function():void {
					asyncToken.mx_internal::applyResult(new ResultEvent(ResultEvent.RESULT, false, true, true, asyncToken, null));
				}, 200);
		}

		public function retrieveInformation(userId:String):void {
			var asyncToken:AsyncToken=new AsyncToken(null);
			var fakeIdentity:Identity=new Identity();

			fakeIdentity.displayName="Fake Impersonation ID";
			fakeIdentity.userId=userId;

			asyncToken.addResponder(new Responder(function(data:Object):void {
				//
				// Transform / normalize response if necessary
				//
					responder.result(data);
				}, function(info:Object):void {
					responder.fault(info);
				}));

			setTimeout(function():void {
					asyncToken.mx_internal::applyResult(new ResultEvent(ResultEvent.RESULT, false, true, fakeIdentity, asyncToken, null));
				}, 200);
		}

	}
}