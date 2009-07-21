/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.hydraframework.plugins.authentication.data.interfaces {
	import flash.utils.Dictionary;

	import mx.collections.ArrayCollection;

	public interface IPrincipal {
		function get roles():ArrayCollection;
		function set roles(value:ArrayCollection):void;
		function get dataRestrictions():Dictionary;
		function set dataRestrictions(value:Dictionary):void;
		function get rolesLoaded():Boolean;
		function set rolesLoaded(value:Boolean):void;
		function get dataRestrictionsLoaded():Boolean;
		function set dataRestrictionsLoaded(value:Boolean):void;
		[Bindable(event="plugins_Authentication_identityChange")]
		function get identity():IIdentity;
		function set identity(value:IIdentity):void;
		function get impersonated():Boolean;
		function set impersonated(value:Boolean):void;

		function isInRole(roleName:String):Boolean;
		function getDataRestrictionValues(restrictionName:String):ArrayCollection;
		function clear():void;
	}
}