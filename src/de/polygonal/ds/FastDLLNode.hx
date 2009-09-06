/*
 * HX3DS - DATA STRUCTURES FOR GAME PROGRAMMERS
 * Copyright (c) 2009 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

package de.polygonal.ds;

class FastDLLNode<T> implements haxe.rtti.Generic
{
	public var val:T;
	
	public var next:FastDLLNode<T>;
	public var prev:FastDLLNode<T>;
	
	public var id:Int;
	
	#if debug
	public var list:FastDLL<T>;
	#end
	
	inline public function hasNext():Bool
	{
		return next != null;
	}

	inline public function hasPrev():Bool
	{
		return prev != null;
	}
	
	inline public function insertAfter(node:FastDLLNode<T>):Void
	{
		node.next = next;
		node.prev = this;
		if (hasNext()) next.prev = node;
		next = node;
	}
	
	inline public function insertBefore(node:FastDLLNode<T>):Void
	{
		node.next = this;
		node.prev = prev;
		if (hasPrev()) prev.next = node;
		prev = node;
	}
	
	inline public function unlink():Void
	{
		if (hasPrev()) prev.next = next;
		if (hasNext()) next.prev = prev;
		next = prev = null;
	}

	public function new(val:Null<T>)
	{
		this.val = val;
	}
}